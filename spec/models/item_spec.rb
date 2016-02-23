require 'rails_helper'

RSpec.describe Item, type: :model do
  before { @item = build(:item)}

  subject { @item }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:unit_price) }
  it { should respond_to(:merchant_id) }
  it { should be_valid }
  it { should belong_to :merchant }
end
