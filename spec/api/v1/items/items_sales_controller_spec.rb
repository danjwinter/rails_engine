require 'rails_helper'

describe Api::V1::Items::ItemsSalesController do
  describe "GET#index", type: :controller do
    before(:each) do
      create(:item)
      @item = create(:item)
      invoice = create(:invoice)
                create(:transaction,
                       invoice_id: invoice.id)
                create(:invoice_item,
                       item_id: @item.id,
                       invoice_id: invoice.id)
    end

    it "returns the highest sold items" do
      get :index, format: :json, id: @item.id, quantity: 1
      items_response = json_response

      expect(response.status).to eq 200
      expect(items_response.first[:id]).to eq @item.id
    end
  end
end
