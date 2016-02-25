require 'rails_helper'

RSpec.describe Item, type: :model do
  before { @item = create(:item)}

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

    # byebug
    expect(@item.best_day).to eq @invoice.created_at
  end
end
