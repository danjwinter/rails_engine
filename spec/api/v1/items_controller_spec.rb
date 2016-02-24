require 'rails_helper'

describe Api::V1::ItemsController do
  describe "GET #show" do
    it "returns the information about an item in json" do
      @item = create(:item)
      get api_v1_item_path @item, format: :json
      item_response = json_response
      expect(item_response[:name]).to eq @item.name
      expect(item_response[:description]).to eq @item.description
      expect(item_response[:unit_price]).to eq @item.unit_price
      expect(response.status).to eq 200
    end
  end

  describe "GET #index", type: :controller do
    before(:each) do
      4.times { create(:item) }
      get :index, format: :json
      # get api_v1_items_path, format: :json
    end

    it "returns 4 records from the database" do |variable|
      items_response = JSON.parse(response.body, symbolize_names: true)
      expect(items_response.count).to eq 4
      expect(response.status).to eq 200
    end
  end
end
