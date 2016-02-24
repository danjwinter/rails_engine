require 'rails_helper'

describe Api::V1::InvoiceItems::InvoiceItemsInvoicesController do
  describe "GET#index", type: :controller do
    before(:each) do
      @invoice_item = create(:invoice_item)
      @invoice = @invoice_item.invoice
    end

    it "returns the correct invoice items invoices" do

      get :show, format: :json, id: @invoice_item.id
      invoices_items_response = json_response

      expect(invoices_items_response[:id]).to eq @invoice.id
    end
  end
end
