require 'rails_helper'

describe Api::V1::CustomersController do
  describe "GET #show" do
    it "returns the information about a customer in json" do
      @customer = create(:customer)
      get api_v1_customer_path @customer, format: :json
      customer_response = json_response
      expect(customer_response[:first_name]).to eq @customer.first_name
      expect(customer_response[:last_name]).to eq @customer.last_name
      expect(response.status).to eq 200
    end
  end

  describe "GET #index" do
    before(:each) do
      4.times { create(:customer) }
      get api_v1_customers_path, format: :json
    end

    it "returns 4 records from the database" do |variable|
      customers_response = JSON.parse(response.body, symbolize_names: true)
      expect(customers_response[:customers].count).to eq 4
    end
  end
end
