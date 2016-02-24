require 'rails_helper'

describe Api::V1::MerchantsFinderController do
  describe "GET find" do
    before(:each) do
      @merchant = create(:merchant, name: "Bob Frank")
      create(:merchant, name: "Bob Smith")
      create(:merchant, name: "Joe Smith")
    end

    it "returns the correct merchant with the find and id parameter" do
      get "/api/v1/merchants/find?id=#{@merchant.id}"
      merchant_response = json_response
      expect(merchant_response[:name]).to eq @merchant.name
      expect(response.status).to eq 200
    end

    it "returns the correct merchant with the find and name parameter" do
      get "/api/v1/merchants/find?name=#{@merchant.name}"
      merchant_response = json_response
      expect(merchant_response[:name]).to eq @merchant.name
      expect(response.status).to eq 200
    end

    it "returns the correct merchant with the find and name downcased parameter" do
      get "/api/v1/merchants/find?name=#{@merchant.name.downcase}"
      merchant_response = json_response
      expect(merchant_response[:name]).to eq @merchant.name
      expect(response.status).to eq 200
    end
  end

  describe "GET #show + find_all" do
    before(:each) do
      @merchant1 = create(:merchant, name: "Bob")
      @merchant2 = create(:merchant, name: "BoB")
      @merchant3 = create(:merchant, name: "Joe Jones")
    end

    it "returns the correct merchant with the find and id parameter" do
      get "/api/v1/merchants/find_all?name=bob"
      merchant_response = json_response
      expect(merchant_response.count).to eq 2
      expect(merchant_response.first[:id]).to eq @merchant1.id
      expect(merchant_response.last[:id]).to eq @merchant2.id
      expect(response.status).to eq 200
    end
  end
end
