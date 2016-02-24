require 'rails_helper'

describe Api::V1::Invoices::InvoicesInvoicesItemsController do
  describe "GET#index", type: :controller do
    before(:each) do
      @invoice = create(:invoice)
    end

    it "returns the correct invoice invoice items" do
      3.times { @invoice.invoice_items << create(:invoice_item) }
      first_invoice_item = @invoice.invoice_items.first

      get :index, format: :json, id: @invoice.id
      invoices_response = json_response

      expect(invoices_response.count).to eq 3
      expect(invoices_response.first[:id]).to eq first_invoice_item.id
    end
  end
end
