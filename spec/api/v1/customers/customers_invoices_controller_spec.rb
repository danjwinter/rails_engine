require 'rails_helper'

describe Api::V1::Customers::CustomersInvoicesController do
  describe "GET#index", type: :controller do
    before(:each) do
      @customer = create(:customer)
    end

    it "returns the correct customer invoices" do
      3.times { @customer.invoices << create(:invoice) }
      first_invoice = @customer.invoices.first

      get :index, format: :json, id: @customer.id
      customers_response = json_response

      expect(customers_response.count).to eq 3
      expect(customers_response.first[:id]).to eq first_invoice.id
    end
  end
end
