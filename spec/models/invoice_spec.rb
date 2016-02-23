require 'rails_helper'

RSpec.describe Invoice, type: :model do
  before { @invoice = build(:invoice)}

  subject { @invoice }

  it { should respond_to(:customer_id) }
  it { should respond_to(:merchant_id) }
  it { should respond_to(:status) }

  it { should be_valid }
  it { should belong_to :merchant }
  it { should belong_to :customer }
end
