require 'rails_helper'

describe Api::V1::Invoices::InvoicesCustomersController do
  describe "GET#show", type: :controller do
    before(:each) do
      @customer = create(:customer)
      @invoice = create(:invoice, customer_id: @customer.id)
    end

    it "returns the correct invoice customer" do

      get :show, format: :json, id: @invoice.id
      invoices_response = json_response

      expect(invoices_response[:id]).to eq @customer.id
    end
  end
end
