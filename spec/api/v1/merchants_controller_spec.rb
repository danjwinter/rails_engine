require 'rails_helper'

describe Api::V1::MerchantsController do
  describe "GET #show" do
    it "returns the information about a merchant in json" do
      @merchant = create(:merchant)
      get api_v1_merchant_path @merchant, format: :json
      merchant_response = json_response
      expect(merchant_response[:name]).to eq @merchant.name
      expect(response.status).to eq 200
    end
  end

  describe "GET #index" do
    before(:each) do
      4.times { create(:merchant) }
      get api_v1_merchants_path, format: :json
    end

    it "returns 4 records from the database" do |variable|
      merchants_response = JSON.parse(response.body, symbolize_names: true)
      expect(merchants_response[:merchants].count).to eq 4
    end
  end

  # describe "GET find" do
  #   before(:each) do
  #     @item = create(:item, name: "Chair", unit_price: 10)
  #     create(:item, name: "Rocking chair")
  #     create(:item, name: "Pool")
  #   end
  #
  #   it "returns the correct item with the find and id parameter" do
  #     get "/api/v1/items/find?id=#{@item.id}"
  #     item_response = json_response
  #     expect(item_response[:name]).to eq @item.name
  #     expect(item_response[:description]).to eq @item.description
  #     expect(item_response[:unit_price]).to eq @item.unit_price
  #     expect(response.status).to eq 200
  #   end
  #
  #   it "returns the correct item with the find and name parameter" do
  #     get "/api/v1/items/find?name=#{@item.name}"
  #     item_response = json_response
  #     expect(item_response[:name]).to eq @item.name
  #     expect(item_response[:description]).to eq @item.description
  #     expect(item_response[:unit_price]).to eq @item.unit_price
  #     expect(response.status).to eq 200
  #   end
  #
  #   it "returns the correct item with the find and name downcased parameter" do
  #     get "/api/v1/items/find?name=#{@item.name.downcase}"
  #     item_response = json_response
  #     expect(item_response[:name]).to eq @item.name
  #     expect(item_response[:description]).to eq @item.description
  #     expect(item_response[:unit_price]).to eq @item.unit_price
  #     expect(response.status).to eq 200
  #   end
  # end
  #
  # describe "GET #show + find_all" do
  #   before(:each) do
  #     @item1 = create(:item, name: "Chair", unit_price: 10)
  #     @item2 = create(:item, name: "Rocking chair")
  #     @item3 = create(:item, name: "Pool")
  #   end
  #
  #   it "returns the correct item with the find and id parameter" do
  #     get "/api/v1/items/find_all?name=chair"
  #     item_response = json_response
  #     expect(item_response[:items].count).to eq 2
  #     expect(item_response[:items].first[:id]).to eq @item1.id
  #     expect(item_response[:items].last[:id]).to eq @item2.id
  #     expect(response.status).to eq 200
  #   end
  # end
end
