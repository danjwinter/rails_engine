require 'rails_helper'

RSpec.describe Invoice, type: :model do
  before do
    @customer = create(:customer)
    @merchant = create(:merchant)
    create(:item)
    @item = create(:item)
   @invoice = create(:invoice,
                     created_at: "2012-03-27 14:54:16 UTC")
              create(:transaction,
                     invoice_id: @invoice.id,
                     result: "failed")
              create(:invoice_item,
                     item_id: @item.id,
                     invoice_id: @invoice.id)

  @invoice2 = create(:invoice,
                     created_at: "2014-08-17 14:54:16 UTC",
                     customer_id: @customer.id,
                     merchant_id: @merchant.id)
              create(:invoice,
                     customer_id: @customer.id,
                     merchant_id: @merchant.id)
    2.times do
              create(:transaction,
                     invoice_id: @invoice2.id)
              create(:invoice_item,
                     item_id: @item.id,
                     invoice_id: @invoice2.id,
                     unit_price: 10.00,
                     quantity: 2)
    end
  end
  subject { @invoice }

  it { should respond_to(:customer_id) }
  it { should respond_to(:merchant_id) }
  it { should respond_to(:status) }

  it { should be_valid }
  it { should belong_to :merchant }
  it { should belong_to :customer }

  describe ".paid" do
    it "should return invoices with transactions marked as success" do
      expect(Invoice.paid.first).to eq @invoice2
    end
  end

  describe ".pending" do
    it "should return invoices with transactions marked as failure" do
      expect(Invoice.pending.first).to eq @invoice
    end
  end

  describe ".by_date" do
    it "should return invoices for that date" do
      expect(Invoice.by_date(@invoice.created_at).first).to eq @invoice
    end
  end

  describe ".favorite_customers" do
    it "should return customers who have most successful transactions" do
      expect(Invoice.favorite_customers.first.customer_id).to eq @customer.id
    end
  end

  describe ".favorite_merchants" do
    it "should return merchants who have most successful transactions" do
      expect(Invoice.favorite_merchants.first.merchant_id).to eq @merchant.id
    end
  end

  describe ".total_revenue_by_date" do
    it "should return total revenue by date" do
      expect(Invoice.total_revenue_by_date(@invoice2.created_at)).to eq "80.0"
    end
  end
end
