require 'rails_helper'

describe Api::V1::InvoiceItemsController do
  describe "GET #show" do
    it "returns the information about an invoice items in json" do
      @invoice_item = create(:invoice_item)
      get api_v1_invoice_item_path @invoice_item, format: :json
      invoice_item_response = json_response

      expect(invoice_item_response[:item_id]).to eq @invoice_item.item_id
      expect(invoice_item_response[:invoice_id]).to eq @invoice_item.invoice_id
      expect(invoice_item_response[:quantity]).to eq @invoice_item.quantity
      expect(invoice_item_response[:unit_price]).to eq @invoice_item.unit_price
      expect(response.status).to eq 200
    end
  end

  describe "GET #index" do
    before(:each) do
      4.times { create(:invoice_item) }
      get api_v1_invoice_items_path, format: :json
    end

    it "returns 4 records from the database" do |variable|
      invoice_items_response = JSON.parse(response.body, symbolize_names: true)
      expect(invoice_items_response.count).to eq 4
    end
  end
end
