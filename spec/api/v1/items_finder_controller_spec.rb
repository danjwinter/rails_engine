require 'rails_helper'

describe Api::V1::ItemsFinderController do
  describe "GET find", type: :controller do
    before(:each) do
      @item = create(:item, name: "Chair", unit_price: 1.00, created_at: "2012-03-27 14:53:59 UTC")
      # @item.unit_price = (@item.unit_price / 100).to_s
      create(:item, name: "Rocking chair", )
      create(:item, name: "Pool")
    end

    it "returns the correct item with the find and id parameter" do
      get :show, id: @item.id, format: :json

      # get "/api/v1/items/find?id=#{@item.id}"
      item_response = json_response
      expect(item_response[:name]).to eq @item.name
      expect(item_response[:description]).to eq @item.description
      expect(item_response[:unit_price]).to eq @item.unit_price.to_s
      expect(response.status).to eq 200
    end

    it "returns the correct item with the find and name parameter" do
      # get "/api/v1/items/find?name=#{@item.name}"
      get :show, name: @item.name, format: :json
      item_response = json_response
      expect(item_response[:name]).to eq @item.name
      expect(item_response[:description]).to eq @item.description
      expect(item_response[:unit_price]).to eq @item.unit_price.to_s
      expect(response.status).to eq 200
    end

    it "returns the correct item with the find and name downcased parameter" do
      get :show, name: @item.name.downcase, format: :json
      # get "/api/v1/items/find?name=#{@item.name.downcase}"
      item_response = json_response
      expect(item_response[:name]).to eq @item.name
      expect(item_response[:description]).to eq @item.description
      expect(item_response[:unit_price]).to eq @item.unit_price.to_s
      expect(response.status).to eq 200
    end

    it "returns the correct item with find and created_at" do
      get :show, created_at: @item.created_at, format: :json
      # get "/api/v1/items/find?created_at=#{@item.created_at}"
      item_response = json_response
      expect(item_response[:name]).to eq @item.name
      expect(item_response[:description]).to eq @item.description
      expect(item_response[:unit_price]).to eq @item.unit_price.to_s
      expect(response.status).to eq 200
    end
  end

  describe "GET find_all" do
    before(:each) do
      @item1 = create(:item, name: "Chair", unit_price: 1.00)
      @item2 = create(:item, name: "chair")
      @item3 = create(:item, name: "Pool")
    end

    it "returns the correct item with the find and id parameter" do
      get "/api/v1/items/find_all?name=chair"
      item_response = json_response
      expect(item_response.count).to eq 2
      expect(item_response.first[:id]).to eq @item1.id
      expect(item_response.last[:id]).to eq @item2.id
      expect(response.status).to eq 200
    end
  end
end
