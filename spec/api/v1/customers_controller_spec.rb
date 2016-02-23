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

  describe "GET find" do
    before(:each) do
      @customer = create(:customer, first_name: "Bob")
      create(:customer)
      create(:customer)
    end

    it "returns the correct customer with the find and id parameter" do
      # get :find, id: @customer.id, format: :json
      get "/api/v1/customers/find?id=#{@customer.id}"
      customer_response = json_response
      expect(customer_response[:first_name]).to eq @customer.first_name
      expect(customer_response[:last_name]).to eq @customer.last_name
      expect(response.status).to eq 200
    end

    it "returns the correct customer with the find and name parameter" do
      get "/api/v1/customers/find?first_name=#{@customer.first_name}"
      customer_response = json_response
      expect(customer_response[:first_name]).to eq @customer.first_name
      expect(customer_response[:last_name]).to eq @customer.last_name
      expect(response.status).to eq 200
    end

    it "returns the correct customer with the find and name downcased parameter" do
      get "/api/v1/customers/find?first_name=#{@customer.first_name.downcase}"
      customer_response = json_response
      expect(customer_response[:first_name]).to eq @customer.first_name
      expect(customer_response[:last_name]).to eq @customer.last_name
      expect(response.status).to eq 200
    end

    # it "returns the correct customer with find and created_at" do
    #   get "/api/v1/customers/find?created_at=#{@customer.created_at}"
    #   customer_response = json_response
    #   expect(customer_response[:first_name]).to eq @customer.first_name
    #   expect(customer_response[:last_name]).to eq @customer.last_name
    #   expect(response.status).to eq 200
    # end
  end

  describe "GET find_all" do
    before(:each) do
      @customer1 = create(:customer, first_name: "Bob", last_name: "Smith")
      @customer2 = create(:customer, first_name: "Bob", last_name: "Johnson")
      @customer3 = create(:customer, first_name: "Frank")
    end

    it "returns the correct customer with the find and id parameter" do
      get "/api/v1/customers/find_all?first_name=bob"
      customer_response = json_response
      expect(customer_response[:customers].count).to eq 2
      expect(customer_response[:customers].first[:id]).to eq @customer1.id
      expect(customer_response[:customers].last[:id]).to eq @customer2.id
      expect(response.status).to eq 200
    end
  end
end
