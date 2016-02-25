require 'spec_helper'

RSpec.describe Merchant, type: :model do
  before { @merchant = create(:merchant)}

  subject { @merchant }

  it { should respond_to(:name) }
  it { should be_valid }

  before(:each) do
                create(:customer)
    @customer = create(:customer)
    item      = create(:item,
                       merchant_id: @merchant.id)
    invoice   = create(:invoice,
                       merchant_id: @merchant.id,
                       customer_id: @customer.id)
                create(:invoice_item,
                       item_id: item.id,
                       invoice_id: invoice.id,
                       unit_price: 20.00,
                       quantity: 2)
                create(:transaction,
                       invoice_id: invoice.id)
  end

  it "#revenue returns total revenue" do
    expect(@merchant.revenue).to eq 40
  end

  it "#revenue_by_date returns total revenue by date" do
    item      = create(:item,
                       merchant_id: @merchant.id)
    invoice   = create(:invoice,
                       merchant_id: @merchant.id,
                       created_at: "2012-03-27 14:54:16 UTC")
                create(:invoice_item,
                       item_id: item.id,
                       invoice_id: invoice.id,
                       unit_price: 20.00,
                       quantity: 3)
                create(:transaction,
                       invoice_id: invoice.id)

    revenue = @merchant.revenue_by_date("2012-03-27 14:54:16 UTC")

    expect(revenue).to eq 60
  end

  it "#favorite_customer returns merchant's favorite customer" do
    expect(@merchant.favorite_customer).to eq @customer
  end

  it "#pending_invoices_customers returns customers who have not paid" do
    customer  = create(:customer)
    item      = create(:item,
                       merchant_id: @merchant.id)
    invoice   = create(:invoice,
                       merchant_id: @merchant.id,
                       customer_id: customer.id)
                create(:invoice_item,
                       item_id: item.id,
                       invoice_id: invoice.id,
                       unit_price: 20.00,
                       quantity: 3)
                create(:transaction,
                       invoice_id: invoice.id,
                       result: "failed")

    expect(@merchant.pending_invoices_customers.first).to eq customer
  end
end
