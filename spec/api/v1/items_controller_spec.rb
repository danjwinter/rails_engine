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

  describe "GET #index" do
    before(:each) do
      4.times { create(:item) }
      # get :index, format: :json
      get api_v1_items_path, format: :json
    end

    it "returns 4 records from the database" do |variable|
      items_response = JSON.parse(response.body, symbolize_names: true)
      expect(items_response[:items].count).to eq 4
      expect(response.status).to eq 200
    end
  end

  describe "GET find" do
    before(:each) do
      @item = create(:item, name: "Chair", unit_price: 10, created_at: "2012-03-27 14:53:59 UTC")
      create(:item, name: "Rocking chair", )
      create(:item, name: "Pool")
    end

    it "returns the correct item with the find and id parameter" do
      # get :find, id: @item.id, format: :json
      get "/api/v1/items/find?id=#{@item.id}"
      item_response = json_response
      expect(item_response[:name]).to eq @item.name
      expect(item_response[:description]).to eq @item.description
      expect(item_response[:unit_price]).to eq @item.unit_price
      expect(response.status).to eq 200
    end

    it "returns the correct item with the find and name parameter" do
      get "/api/v1/items/find?name=#{@item.name}"
      item_response = json_response
      expect(item_response[:name]).to eq @item.name
      expect(item_response[:description]).to eq @item.description
      expect(item_response[:unit_price]).to eq @item.unit_price
      expect(response.status).to eq 200
    end

    it "returns the correct item with the find and name downcased parameter" do
      get "/api/v1/items/find?name=#{@item.name.downcase}"
      item_response = json_response
      expect(item_response[:name]).to eq @item.name
      expect(item_response[:description]).to eq @item.description
      expect(item_response[:unit_price]).to eq @item.unit_price
      expect(response.status).to eq 200
    end

    it "returns the correct item with find and created_at" do
      get "/api/v1/items/find?created_at=#{@item.created_at}"
      item_response = json_response
      expect(item_response[:name]).to eq @item.name
      expect(item_response[:description]).to eq @item.description
      expect(item_response[:unit_price]).to eq @item.unit_price
      expect(response.status).to eq 200
    end
  end

  describe "GET find_all" do
    before(:each) do
      @item1 = create(:item, name: "Chair", unit_price: 10)
      @item2 = create(:item, name: "Rocking chair")
      @item3 = create(:item, name: "Pool")
    end

    it "returns the correct item with the find and id parameter" do
      get "/api/v1/items/find_all?name=chair"
      item_response = json_response
      expect(item_response[:items].count).to eq 2
      expect(item_response[:items].first[:id]).to eq @item1.id
      expect(item_response[:items].last[:id]).to eq @item2.id
      expect(response.status).to eq 200
    end
  end
end
