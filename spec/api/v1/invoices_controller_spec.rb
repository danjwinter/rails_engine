require 'rails_helper'

describe Api::V1::InvoicesController do
  describe "GET #show", type: :controller do
    it "returns the information about an invoice in json" do
      @invoice = create(:invoice)
      get :show, format: :json, id: @invoice.id
      invoice_response = json_response
      expect(invoice_response[:customer_id]).to eq @invoice.customer_id
      expect(invoice_response[:merchant_id]).to eq @invoice.merchant_id
      expect(invoice_response[:status]).to eq @invoice.status
      expect(response.status).to eq 200
    end
  end

  describe "GET #index", type: :controller do
    before(:each) do
      4.times { create(:invoice) }
      get :index, format: :json
    end

    it "returns 4 records from the database" do |variable|
      invoices_response = JSON.parse(response.body, symbolize_names: true)
      expect(invoices_response.count).to eq 4
      expect(invoices_response.first).to have_key(:customer_id)
      expect(invoices_response.first).to have_key(:merchant_id)
      expect(invoices_response.first).to have_key(:status)
    end
  end
end
