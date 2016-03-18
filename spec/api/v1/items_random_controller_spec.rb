require 'rails_helper'

describe Api::V1::ItemsRandomController do
  describe "GET #show", type: :controller do
    it "returns a random item" do
      create_list(:item, 2)

      get :show, format: :json

      expect(response).to be_success
      expect(json_response.first).to have_key :name
      expect(json_response.first).to have_key :unit_price
      expect(json_response.first).to have_key :description
      expect(json_response.first).to have_key :merchant_id
    end
  end
end
