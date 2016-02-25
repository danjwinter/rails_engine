require 'rails_helper'

describe Api::V1::Customers::CustomersFavoriteMerchantsController do
  describe "GET#show", type: :controller do
    before(:each) do
      create(:merchant)
      @customer = create(:customer)
      @merchant = create(:merchant)
      invoice   = create(:invoice,
                         customer_id: @customer.id,
                         merchant_id: @merchant.id)
                  create(:transaction,
                         invoice_id: invoice.id,
                         result: "success")

    end

    it "returns the correct customers favorite merchant" do
      get :show, format: :json, id: @customer.id
      customers_response = json_response

      expect(customers_response[:id]).to eq @merchant.id
    end
  end
end
