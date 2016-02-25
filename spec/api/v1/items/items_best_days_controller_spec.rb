require 'rails_helper'

describe Api::V1::Items::ItemsBestDaysController do
  describe "GET#show", type: :controller do
    before(:each) do
      create(:item)
      @item = create(:item)
      invoice = create(:invoice,
                       created_at: "2012-03-27 14:54:16 UTC")
                create(:transaction,
                       invoice_id: invoice.id)
                create(:invoice_item,
                       item_id: @item.id,
                       invoice_id: invoice.id)

      2.times do
      invoice = create(:invoice,
                       created_at: "2014-08-17 14:54:16 UTC")
                create(:transaction,
                       invoice_id: invoice.id)
                create(:invoice_item,
                       item_id: @item.id,
                       invoice_id: invoice.id)
      end


    end

    it "returns the day with the most sales for the item" do
      get :show, format: :json, id: @item.id
      items_response = json_response

      expect(response.status).to eq 200
      expect(items_response[:best_day]).to eq "2014-08-17T14:54:16.000Z"
    end
  end
end
