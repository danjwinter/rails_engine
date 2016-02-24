require 'rails_helper'

describe Api::V1::InvoiceItems::InvoiceItemsItemsController do
  describe "GET#index", type: :controller do
    before(:each) do
      @item = create(:item)
      @invoice_item = create(:invoice_item, item_id: @item.id)
    end

    it "returns the correct invoice items invoices" do

      get :show, format: :json, id: @invoice_item.id
      invoices_items_response = json_response

      expect(invoices_items_response[:id]).to eq @item.id
    end
  end
end
