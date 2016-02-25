require 'rails_helper'

describe Api::V1::Merchants::MerchantsRevenuesController do
  before(:each) do
    create(:merchant)
    @merchant = create(:merchant)
    create_item_for_merchant(@merchant)
  end
  describe "GET#index", type: :controller do

    it "returns the correct merchant with the top revenue" do
      get :index, format: :json, id: @merchant.id, quantity: 1

      merchants_response = json_response

      expect(response.status).to eq 200
      expect(merchants_response.first[:id]).to eq @merchant.id
    end
  end
  describe "GET#show", type: :controller do
    it "returns total revenue for the merchant when no date given" do
      create_item_for_merchant(@merchant)

      get :show, format: :json, id: @merchant.id

      merchants_response = json_response

      expect(response.status).to eq 200
      expect(merchants_response[:revenue]).to eq "20.0"
    end

    it "returns total revenue for the merchant for a specific date when date given" do
      item      = create(:item,
                         merchant_id: @merchant.id)
      invoice   = create(:invoice,
                         merchant_id: @merchant.id,
                         created_at: "2012-03-27 14:54:16 UTC")
                  create(:invoice_item,
                         item_id: item.id,
                         invoice_id: invoice.id,
                         unit_price: 10.00)
                  create(:transaction,
                         invoice_id: invoice.id)

       get :show, format: :json, id: @merchant.id, date: invoice.created_at

       merchants_response = json_response

       expect(response.status).to eq 200
       expect(merchants_response[:revenue]).to eq "10.0"
    end
  end
end

def create_item_for_merchant(merchant)
  item      = create(:item,
                     merchant_id: merchant.id)
  invoice   = create(:invoice,
                     merchant_id: merchant.id)
              create(:invoice_item,
                     item_id: item.id,
                     invoice_id: invoice.id,
                     unit_price: 10.00)
              create(:transaction,
                     invoice_id: invoice.id)
end
