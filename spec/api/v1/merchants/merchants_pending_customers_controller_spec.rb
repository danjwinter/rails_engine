require 'rails_helper'

describe Api::V1::Merchants::MerchantsCustomersPendingInvoicesController do
  describe "GET#index", type: :controller do
    before(:each) do
      @customer = create(:customer)
                  create(:customer)
      @merchant = create(:merchant)

      item      = create(:item,
                         merchant_id: @merchant.id)
      invoice   = create(:invoice,
                         merchant_id: @merchant.id,
                         customer_id: @customer.id)
                  create(:invoice_item,
                         item_id: item.id,
                         invoice_id: invoice.id)
                  create(:transaction,
                         invoice_id: invoice.id,
                         result: "failed")
    end

    it "returns the customer to whom the merchant has the most sales" do
      get :index, format: :json, id: @merchant.id

      merchants_response = json_response

      expect(response.status).to eq 200
      expect(merchants_response.first[:id]).to eq @customer.id
    end
  end
end
