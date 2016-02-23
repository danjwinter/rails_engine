require 'rails_helper'

describe Api::V1::TransactionsController do
  describe "GET #show" do
    it "returns the information about a transaction in json" do
      @transaction = create(:transaction)
      get api_v1_transaction_path @transaction, format: :json
      transaction_response = json_response
      expect(transaction_response[:invoice_id]).to eq @transaction.invoice_id
      expect(transaction_response[:credit_card_number]).to eq @transaction.credit_card_number
      expect(transaction_response[:credit_card_expiration_date]).to eq @transaction.credit_card_expiration_date
      expect(transaction_response[:result]).to eq @transaction.result
      expect(response.status).to eq 200
    end
  end

  describe "GET #index" do
    before(:each) do
      4.times { create(:transaction) }
      get api_v1_transactions_path, format: :json
    end

    it "returns 4 records from the database" do |variable|
      transactions_response = JSON.parse(response.body, symbolize_names: true)
      expect(transactions_response[:transactions].count).to eq 4
    end
  end
end
