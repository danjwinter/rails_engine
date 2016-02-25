
require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsFinderController do
  describe "GET find", type: :controller do
    before(:each) do
      @invoice_item = create(:invoice_item, unit_price: 3.00, quantity: 55, created_at: "2012-03-27 14:53:59 UTC")
      create(:invoice_item)
      create(:invoice_item)
    end

    it "returns the correct invoice_item with the find and id parameter" do
      get :show, id: @invoice_item.id, format: :json
      invoice_item_response = json_response
      expect(invoice_item_response[:id]).to eq @invoice_item.id
      expect(invoice_item_response[:quantity]).to eq @invoice_item.quantity
      expect(invoice_item_response[:unit_price]).to eq @invoice_item.unit_price.to_s
      expect(response.status).to eq 200
    end

    it "returns the correct invoice_item with the find and name parameter" do
      get :show, quantity: @invoice_item.quantity, format: :json
      invoice_item_response = json_response
      expect(invoice_item_response[:quantity]).to eq @invoice_item.quantity
      expect(invoice_item_response[:unit_price]).to eq @invoice_item.unit_price.to_s
      expect(response.status).to eq 200
    end

    it "returns the correct invoice_item with the find and name downcased parameter" do
      get :show, unit_price: @invoice_item.unit_price, format: :json
      invoice_item_response = json_response
      expect(invoice_item_response[:quantity]).to eq @invoice_item.quantity
      expect(invoice_item_response[:unit_price]).to eq @invoice_item.unit_price.to_s
      expect(response.status).to eq 200
    end

    it "returns the correct invoice_item with find and created_at" do
      get :show, created_at: @invoice_item.created_at, format: :json
      invoice_item_response = json_response
      expect(invoice_item_response[:quantity]).to eq @invoice_item.quantity
      expect(invoice_item_response[:unit_price]).to eq @invoice_item.unit_price.to_s
      expect(response.status).to eq 200
    end
  end

  describe "GET find_all", type: :controller do
    before(:each) do
      @invoice_item1 = create(:invoice_item, unit_price: 3.00)
      @invoice_item2 = create(:invoice_item, unit_price: 3.00)
      @invoice_item3 = create(:invoice_item, unit_price: 16.20)
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
