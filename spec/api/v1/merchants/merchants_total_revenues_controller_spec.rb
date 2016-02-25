require 'rails_helper'

describe Api::V1::Merchants::MerchantsTotalRevenuesController do
  describe "GET#show", type: :controller do
    before(:each) do
      merchant2 = create(:merchant)
      merchant1 = create(:merchant)

    [merchant1, merchant2].each do |merchant|
      item      = create(:item,
                         merchant_id: merchant.id)
      @invoice   = create(:invoice,
                         merchant_id: merchant.id,
                         created_at: "2012-03-27 14:54:16 UTC")
                  create(:invoice_item,
                         item_id: item.id,
                         invoice_id: @invoice.id,
                         unit_price: 10.00)
                  create(:transaction,
                         invoice_id: @invoice.id)
                       end
    end

    it "returns the correct total revenue" do
      get :show, format: :json, date: @invoice.created_at

      merchants_response = json_response

      expect(response.status).to eq 200
      expect(merchants_response[:total_revenue]).to eq "20.0"
    end
  end
end
