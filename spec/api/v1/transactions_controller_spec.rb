require 'rails_helper'

describe Api::V1::TransactionsController do
  describe "GET #show", type: :controller do
    it "returns the information about a transaction in json" do
      @transaction = create(:transaction)

      get :show, id: @transaction.id, format: :json

      transaction_response = json_response

      expect(transaction_response[:invoice_id]).to eq @transaction.invoice_id
      expect(transaction_response[:credit_card_number]).to eq @transaction.credit_card_number
      expect(transaction_response[:result]).to eq @transaction.result
      expect(response.status).to eq 200
    end
  end

  describe "GET #index", type: :controller do
    before(:each) do
      4.times { create(:transaction) }
      get :index, format: :json
    end

    it "returns 4 records from the database" do |variable|
      transactions_response = JSON.parse(response.body, symbolize_names: true)
      expect(transactions_response.count).to eq 4
      expect(transactions_response.first).to have_key(:invoice_id)
      expect(transactions_response.first).to have_key(:credit_card_number)
      expect(transactions_response.first).to have_key(:result)
    end
  end
end
