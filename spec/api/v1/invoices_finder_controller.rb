require 'rails_helper'

describe Api::V1::InvoicesFinderController do
  describe "GET find" do
    before(:each) do
      @invoice = create(:invoice, created_at: "2012-03-27 14:53:59 UTC")
      create(:invoice)
      create(:invoice)
    end

    it "returns the correct invoice with the find and id parameter" do
      # get :find, id: @invoice.id, format: :json
      get "/api/v1/invoices/find?id=#{@invoice.id}"
      invoice_response = json_response
      expect(invoice_response[:id]).to eq @invoice.id
      expect(invoice_response[:status]).to eq @invoice.status
      expect(invoice_response[:customer_id]).to eq @invoice.customer_id
      expect(invoice_response[:merchant_id]).to eq @invoice.merchant_id
      expect(response.status).to eq 200
    end

    it "returns the correct invoice with the find and status parameter" do
      get "/api/v1/invoices/find?quantity=#{@invoice.status}"
      invoice_response = json_response
      expect(invoice_response[:id]).to eq @invoice.id
      expect(response.status).to eq 200
    end

    it "returns the correct invoice with find and created_at" do
      get "/api/v1/invoices/find?created_at=#{@invoice.created_at}"
      invoice_response = json_response
      expect(invoice_response[:id]).to eq @invoice.id
      expect(response.status).to eq 200
    end
  end

  describe "GET find_all", type: :controller do
    before(:each) do
      @invoice1 = create(:invoice, status: "complete")
      @invoice2 = create(:invoice, status: "complete")
      @invoice3 = create(:invoice, status: "pending")
    end

    it "returns the correct invoice with the find and id parameter" do
      get :index, format: :json, status: "complete"

      invoice_response = json_response
      expect(invoice_response.count).to eq 2
      expect(invoice_response.first[:id]).to eq @invoice1.id
      expect(invoice_response.last[:id]).to eq @invoice2.id
      expect(response.status).to eq 200
    end
  end
end
