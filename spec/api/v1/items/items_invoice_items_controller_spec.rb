require 'rails_helper'

describe Api::V1::Items::ItemsInvoiceItemsController do
  describe "GET#index", type: :controller do
    before(:each) do
      @item = create(:item)
      @invoice_item1 = create(:invoice_item, item_id: @item.id)
      @invoice_item2 = create(:invoice_item, item_id: @item.id)
    end

    it "returns the correct items invoice items" do
      get :index, format: :json, id: @item.id
      items_response = json_response

      expect(items_response.count).to eq 2
      expect(items_response.first[:id]).to eq @invoice_item1.id
    end
  end
end
