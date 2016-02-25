require 'rails_helper'

describe Api::V1::Items::ItemsMerchantsController do
  describe "GET#show", type: :controller do
    before(:each) do
      @merchant = create(:merchant)
      @item = create(:item, merchant_id: @merchant.id)
    end

    it "returns the correct items merchant" do
      get :show, format: :json, id: @item.id
      items_response = json_response

      expect(response.status).to eq 200
      expect(items_response[:id]).to eq @merchant.id
    end
  end
end
