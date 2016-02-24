require 'rails_helper'

describe Api::V1::Merchants::MerchantsInvoicesController do
  describe "GET#index", type: :controller do
    before(:each) do
      @merchant = create(:merchant, name: "Bob Frank")
    end

    it "returns the correct merchant with the find and id parameter" do
      3.times { @merchant.invoices << create(:invoice) }
      first_invoice = @merchant.invoices.first

      get :index, format: :json, id: @merchant.id
      merchants_response = json_response

      expect(merchants_response.count).to eq 3
      expect(merchants_response.first[:id]).to eq first_invoice.id
    end
  end
end
