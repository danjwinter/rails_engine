require 'rails_helper'

describe Api::V1::Merchants::MerchantsItemsController do
  describe "GET#index", type: :controller do
    before(:each) do
      @merchant = create(:merchant, name: "Bob Frank")
    end

    it "returns the correct merchant with the find and id parameter" do
      3.times { @merchant.items << create(:item) }
      first_item = @merchant.items.first

      get :index, format: :json, id: @merchant.id
      merchants_response = json_response

      expect(merchants_response.count).to eq 3
      expect(merchants_response.first[:id]).to eq first_item.id
    end
  end
end
