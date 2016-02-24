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
      expect(merchants_response.count).to eq 4
    end
  end
end
