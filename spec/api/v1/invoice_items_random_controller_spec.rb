require 'rails_helper'

describe Api::V1::InvoiceItemsRandomController do
  describe "GET #show", type: :controller do
    it "returns a random item" do
      create_list(:invoice_item, 2)

      get :show, format: :json

      expect(response).to be_success
      expect(json_response.first).to have_key :quantity
      expect(json_response.first).to have_key :unit_price
    end
  end
end
