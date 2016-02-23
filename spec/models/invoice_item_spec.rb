require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  before { @invoice_item = build(:invoice_item)}

  subject { @invoice_item }

  it { should respond_to(:item_id) }
  it { should respond_to(:invoice_id) }
  it { should respond_to(:quantity) }
  it { should respond_to(:unit_price) }

  it { should be_valid }
  it { should belong_to :item }
  it { should belong_to :invoice }
end
