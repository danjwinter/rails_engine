require 'rails_helper'

describe Api::V1::CustomersFinderController do
  describe "GET find", type: :controller do
    before(:each) do
      @customer = create(:customer, first_name: "Bob", created_at: "2012-03-27 14:53:59 UTC")
      create(:customer)
      create(:customer)
    end

    it "returns the correct customer with the find and id parameter" do
      get :show, id: @customer.id, format: :json
      customer_response = json_response
      expect(customer_response[:first_name]).to eq @customer.first_name
      expect(customer_response[:last_name]).to eq @customer.last_name
      expect(response.status).to eq 200
    end

    it "returns the correct customer with the find and name parameter" do
      get :show, first_name: @customer.first_name, format: :json
      customer_response = json_response
      expect(customer_response[:first_name]).to eq @customer.first_name
      expect(customer_response[:last_name]).to eq @customer.last_name
      expect(response.status).to eq 200
    end

    it "returns the correct customer with the find and name downcased parameter" do
      get :show, first_name: @customer.first_name.downcase, format: :json
      customer_response = json_response
      expect(customer_response[:first_name]).to eq @customer.first_name
      expect(customer_response[:last_name]).to eq @customer.last_name
      expect(response.status).to eq 200
    end

    it "returns the correct customer with find and created_at" do
      get :show, created_at: @customer.created_at, format: :json
      customer_response = json_response
      expect(customer_response[:first_name]).to eq @customer.first_name
      expect(customer_response[:last_name]).to eq @customer.last_name
      expect(response.status).to eq 200
    end
  end

  describe "GET find_all", type: :controller do
    before(:each) do
      @customer1 = create(:customer, first_name: "Bob", last_name: "Smith")
      @customer2 = create(:customer, first_name: "Bob", last_name: "Johnson")
      @customer3 = create(:customer, first_name: "Frank")
    end

    it "returns the correct customer with the find and id parameter" do
      get :index, format: :json, first_name: "bob"
      customer_response = json_response
      expect(customer_response.count).to eq 2
      expect(customer_response.first[:id]).to eq @customer1.id
      expect(customer_response.last[:id]).to eq @customer2.id
      expect(response.status).to eq 200
    end
  end
end
