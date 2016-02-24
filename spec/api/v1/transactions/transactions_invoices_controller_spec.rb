require 'rails_helper'

describe Api::V1::Transactions::TransactionsInvoicesController do
  describe "GET#index", type: :controller do
    before(:each) do
      @invoice = create(:invoice)
      @transaction = create(:transaction, invoice_id: @invoice.id)
    end

    it "returns the correct transactions invoice" do
      get :show, format: :json, id: @transaction.id
      items_response = json_response

      expect(response.status).to eq 200
      expect(items_response[:id]).to eq @invoice.id
    end
  end
end
