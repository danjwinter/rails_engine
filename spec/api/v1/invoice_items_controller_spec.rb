require 'rails_helper'

describe Api::V1::InvoiceItemsController do
  describe "GET #show", type: :controller do
    it "returns the information about an invoice items in json" do
      @invoice_item = create(:invoice_item)
      get :show, format: :json, id: @invoice_item.id
      invoice_item_response = json_response

      expect(invoice_item_response[:item_id]).to eq @invoice_item.item_id
      expect(invoice_item_response[:invoice_id]).to eq @invoice_item.invoice_id
      expect(invoice_item_response[:quantity]).to eq @invoice_item.quantity
      expect(invoice_item_response[:unit_price]).to eq @invoice_item.unit_price.to_s
      expect(response.status).to eq 200
    end
  end

  describe "GET #index", type: :controller do
    before(:each) do
      4.times { create(:invoice_item) }
      get :index, format: :json
    end

    it "returns 4 records from the database" do |variable|
      invoice_items_response = JSON.parse(response.body, symbolize_names: true)
      expect(invoice_items_response.count).to eq 4
      expect(invoice_items_response.first).to have_key(:unit_price)
      expect(invoice_items_response.first).to have_key(:quantity)
      expect(invoice_items_response.first).to have_key(:invoice_id)
      expect(invoice_items_response.first).to have_key(:item_id)
    end
  end
end
