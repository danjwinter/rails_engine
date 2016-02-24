
require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsFinderController do
  describe "GET find" do
    before(:each) do
      @invoice_item = create(:invoice_item, unit_price: 300, quantity: 55, created_at: "2012-03-27 14:53:59 UTC")
      create(:invoice_item)
      create(:invoice_item)
    end

    it "returns the correct invoice_item with the find and id parameter" do
      # get :find, id: @invoice_item.id, format: :json
      get "/api/v1/invoice_items/find?id=#{@invoice_item.id}"
      invoice_item_response = json_response
      expect(invoice_item_response[:id]).to eq @invoice_item.id
      expect(invoice_item_response[:quantity]).to eq @invoice_item.quantity
      expect(invoice_item_response[:unit_price]).to eq @invoice_item.unit_price.to_s
      expect(response.status).to eq 200
    end

    it "returns the correct invoice_item with the find and name parameter" do
      get "/api/v1/invoice_items/find?quantity=#{@invoice_item.quantity}"
      invoice_item_response = json_response
      expect(invoice_item_response[:quantity]).to eq @invoice_item.quantity
      expect(invoice_item_response[:unit_price]).to eq @invoice_item.unit_price.to_s
      expect(response.status).to eq 200
    end

    it "returns the correct invoice_item with the find and name downcased parameter" do
      get "/api/v1/invoice_items/find?unit_price=#{@invoice_item.unit_price}"
      invoice_item_response = json_response
      expect(invoice_item_response[:quantity]).to eq @invoice_item.quantity
      expect(invoice_item_response[:unit_price]).to eq @invoice_item.unit_price.to_s
      expect(response.status).to eq 200
    end

    it "returns the correct invoice_item with find and created_at" do
      get "/api/v1/invoice_items/find?created_at=#{@invoice_item.created_at}"
      invoice_item_response = json_response
      expect(invoice_item_response[:quantity]).to eq @invoice_item.quantity
      expect(invoice_item_response[:unit_price]).to eq @invoice_item.unit_price.to_s
      expect(response.status).to eq 200
    end
  end

  describe "GET find_all", type: :controller do
    before(:each) do
      @invoice_item1 = create(:invoice_item, unit_price: 300)
      @invoice_item2 = create(:invoice_item, unit_price: 300)
      @invoice_item3 = create(:invoice_item, unit_price: 12)
    end

    it "returns the correct invoice_item with the find and id parameter" do
      get :index, format: :json, unit_price: 3.00

      invoice_item_response = json_response
      expect(invoice_item_response.count).to eq 2
      expect(invoice_item_response.first[:id]).to eq @invoice_item1.id
      expect(invoice_item_response.last[:id]).to eq @invoice_item2.id
      expect(response.status).to eq 200
    end
  end
end
