require 'rails_helper'

describe Api::V1::InvoicesRandomController do
  describe "GET #show", type: :controller do
    it "returns a random invoice" do
      create_list(:invoice, 2)

      get :show, format: :json

      expect(response).to be_success
      expect(json_response.first).to have_key :status
      expect(json_response.first).to have_key :customer_id
      expect(json_response.first).to have_key :merchant_id
    end
  end
end
