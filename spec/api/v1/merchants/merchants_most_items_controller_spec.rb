require 'rails_helper'

describe Api::V1::Merchants::MerchantsMostItemsController do
  describe "GET#index", type: :controller do
    before(:each) do
      @merchant2 = create(:merchant)
      @merchant = create(:merchant)

      item      = create(:item,
                         merchant_id: @merchant.id)
      invoice   = create(:invoice,
                         merchant_id: @merchant.id)
                  create(:invoice_item,
                         item_id: item.id,
                         invoice_id: invoice.id)
                  create(:transaction,
                         invoice_id: invoice.id)
    end

    it "returns the correct merchant with the most items sold" do
      get :index, format: :json, id: @merchant.id, quantity: 1

      merchants_response = json_response

      expect(response.status).to eq 200
      expect(merchants_response.first[:id]).to eq @merchant.id
    end
  end
end
