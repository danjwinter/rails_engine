require 'rails_helper'

describe Api::V1::MerchantsController do
  describe "GET #show", type: :controller do
    it "returns the information about a merchant in json" do
      @merchant = create(:merchant)
      get :show, id: @merchant.id, format: :json
      merchant_response = json_response
      expect(merchant_response[:name]).to eq @merchant.name
      expect(response.status).to eq 200
    end
  end

  describe "GET #index", type: :controller do
    before(:each) do
      4.times { create(:merchant) }
      get :index, format: :json
    end

    it "returns 4 records from the database" do |variable|
      merchants_response = JSON.parse(response.body, symbolize_names: true)
      expect(merchants_response.count).to eq 4
      expect(merchants_response.first).to have_key(:name)
    end
  end
end
