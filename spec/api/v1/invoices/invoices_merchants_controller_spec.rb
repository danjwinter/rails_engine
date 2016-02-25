require 'rails_helper'

describe Api::V1::Invoices::InvoicesMerchantsController do
  describe "GET#show", type: :controller do
    before(:each) do
      @merchant = create(:merchant)
      @invoice = create(:invoice, merchant_id: @merchant.id)
    end

    it "returns the correct invoice merchant" do
      get :show, format: :json, id: @invoice.id
      invoices_response = json_response

      expect(invoices_response[:id]).to eq @merchant.id
    end
  end
end
