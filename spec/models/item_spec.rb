require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
       @item = create(:item)
      @item2 = create(:item)
     invoice = create(:invoice)
               create(:transaction,
                      invoice_id: invoice.id)
               create(:invoice_item,
                      item_id: @item2.id,
                      invoice_id: invoice.id,
                      unit_price: 10.00,
                      quantity: 3)
     invoice = create(:invoice)
               create(:transaction,
                      invoice_id: invoice.id)
               create(:invoice_item,
                      item_id: @item.id,
                      invoice_id: invoice.id,
                      unit_price: 100.00,
                      quantity: 1)
  end

  subject { @item }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:unit_price) }
  it { should respond_to(:merchant_id) }
  it { should be_valid }
  it { should belong_to :merchant }

  it "#best_day returns the item's best sales day" do
    create(:item)
    invoice = create(:invoice,
                     created_at: "2012-03-27 14:54:16 UTC")
              create(:transaction,
                     invoice_id: invoice.id)
              create(:invoice_item,
                     item_id: @item.id,
                     invoice_id: invoice.id,
                     quantity: 1)


    @invoice = create(:invoice,
                      created_at: "2014-08-17 14:54:16 UTC")
               create(:transaction,
                      invoice_id: @invoice.id)
               create(:invoice_item,
                      item_id: @item.id,
                      invoice_id: @invoice.id,
                      quantity: 20)

    expect(@item.best_day).to eq @invoice.created_at
  end

  describe ".highest_revenue_items" do
    it "returns highest revenue items" do


      expect(Item.highest_revenue_items(1).first).to eq @item
      expect(Item.highest_revenue_items(2).last).to eq @item2
    end
  end

  describe ".most quantity sold" do
    it "returns items sold the most" do

      expect(Item.most_quantity_sold(1).first).to eq @item2
      expect(Item.most_quantity_sold(2).last).to eq @item
    end
  end


end
