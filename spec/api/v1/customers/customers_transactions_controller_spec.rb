require 'rails_helper'

describe Api::V1::Customers::CustomersTransactionsController do
  describe "GET#index", type: :controller do
    before(:each) do
      @customer = create(:customer)
      invoice = create(:invoice, customer_id: @customer.id)
      @transaction = create(:transaction, invoice_id: invoice.id)
    end

    it "returns the correct customer invoices" do
      first_transaction = @customer.transactions.first

      get :index, format: :json, id: @customer.id
      customers_response = json_response

      expect(customers_response.first[:id]).to eq @transaction.id
    end
  end
end
