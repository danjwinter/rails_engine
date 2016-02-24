require 'rails_helper'

describe Api::V1::TransactionsFinderController do
  describe "GET find" do
    before(:each) do
      @transaction = create(:transaction, created_at: "2012-03-27 14:53:59 UTC")
      create(:transaction)
      create(:transaction)
    end

    it "returns the correct transaction with the find and id parameter" do
      # get :find, id: @transaction.id, format: :json
      get "/api/v1/transactions/find?id=#{@transaction.id}"
      transaction_response = json_response
      expect(transaction_response[:id]).to eq @transaction.id
      expect(transaction_response[:invoice_id]).to eq @transaction.invoice_id
      expect(transaction_response[:credit_card_number]).to eq @transaction.credit_card_number
      expect(transaction_response[:credit_card_number]).to eq @transaction.credit_card_number
      expect(transaction_response[:result]).to eq @transaction.result
      expect(response.status).to eq 200
    end

    it "returns the correct transaction with the find and status parameter" do
      get "/api/v1/transactions/find?credit_card_number=#{@transaction.credit_card_number}"
      transaction_response = json_response
      expect(transaction_response[:id]).to eq @transaction.id
      expect(response.status).to eq 200
    end

    it "returns the correct transaction with find and created_at" do
      get "/api/v1/transactions/find?created_at=#{@transaction.created_at}"
      transaction_response = json_response
      expect(transaction_response[:id]).to eq @transaction.id
      expect(response.status).to eq 200
    end
  end

  describe "GET find_all", type: :controller do
    before(:each) do
      @transaction1 = create(:transaction, result: "complete")
      @transaction2 = create(:transaction, result: "complete")
      @transaction3 = create(:transaction, result: "pending")
    end

    it "returns the correct transaction with the find and id parameter" do
      get :index, format: :json, result: "complete"

      transaction_response = json_response
      expect(transaction_response.count).to eq 2
      expect(transaction_response.first[:id]).to eq @transaction1.id
      expect(transaction_response.last[:id]).to eq @transaction2.id
      expect(response.status).to eq 200
    end
  end
end
