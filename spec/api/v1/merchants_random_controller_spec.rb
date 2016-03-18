require 'rails_helper'

describe Api::V1::MerchantsRandomController do
  describe "GET #show", type: :controller do
    it "returns a random customer" do
      create_list(:merchant, 2)

      get :show, format: :json

      expect(response).to be_success
      expect(json_response.first).to have_key :name
    end
  end
end
