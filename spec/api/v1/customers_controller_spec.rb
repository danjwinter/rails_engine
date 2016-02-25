require 'rails_helper'

describe Api::V1::CustomersController do
  describe "GET #show", type: :controller do
    it "returns the information about a customer in json" do
      @customer = create(:customer)
      get :show, id: @customer.id, format: :json
      customer_response = json_response
      expect(customer_response[:first_name]).to eq @customer.first_name
      expect(customer_response[:last_name]).to eq @customer.last_name
      expect(response.status).to eq 200
    end
  end

  describe "GET #index", type: :controller do
    before(:each) do
      4.times { create(:customer) }
      get :index, format: :json
    end

    it "returns 4 records from the database" do |variable|
      customers_response = JSON.parse(response.body, symbolize_names: true)
      expect(customers_response.count).to eq 4
      expect(customers_response.first).to have_key(:first_name)
    end
  end
end
