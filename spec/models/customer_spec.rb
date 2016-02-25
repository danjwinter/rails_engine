require 'rails_helper'

RSpec.describe Customer, type: :model do
  before { @customer = create(:customer)}

  subject { @customer }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should be_valid }
  it { should have_many(:invoices) }
  it { should have_many(:transactions) }

  it "#favotie_merchant returns the merchant the customer has bought the most from" do
    create(:merchant)
    merchant = create(:merchant)
    2.times do
      invoice   = create(:invoice,
                         customer_id: @customer.id,
                         merchant_id: merchant.id)
                  create(:transaction,
                         invoice_id: invoice.id,
                         result: "success")
    end
    expect(@customer.favorite_merchant).to eq merchant
  end
end
