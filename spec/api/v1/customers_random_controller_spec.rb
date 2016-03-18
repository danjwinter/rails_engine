require 'rails_helper'

describe Api::V1::CustomersRandomController do
  describe "GET #show", type: :controller do
    it "returns a random customer" do
      create_list(:customer, 2)

      get :show, format: :json

      expect(response).to be_success
      expect(json_response.first).to have_key :first_name
      expect(json_response.first).to have_key :last_name
    end
  end
end
