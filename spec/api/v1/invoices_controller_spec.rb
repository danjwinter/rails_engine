require 'rails_helper'

describe Api::V1::InvoicesController do
  describe "GET #show" do
    it "returns the information about an invoice in json" do
      @invoice = create(:invoice)
      get api_v1_invoice_path @invoice, format: :json
      invoice_response = json_response
      expect(invoice_response[:customer_id]).to eq @invoice.customer_id
      expect(invoice_response[:merchant_id]).to eq @invoice.merchant_id
      expect(invoice_response[:status]).to eq @invoice.status
      expect(response.status).to eq 200
    end
  end

  describe "GET #index" do
    before(:each) do
      4.times { create(:invoice) }
      get api_v1_invoices_path, format: :json
    end

    it "returns 4 records from the database" do |variable|
      invoices_response = JSON.parse(response.body, symbolize_names: true)
      expect(invoices_response.count).to eq 4
    end
  end
end
