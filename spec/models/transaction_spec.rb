require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before { @transaction = build(:transaction)}

  subject { @transaction }

  it { should respond_to(:invoice_id) }
  it { should respond_to(:credit_card_number) }
  it { should respond_to(:credit_card_expiration_date) }
  it { should respond_to(:result) }
  it { should be_valid }
  it { should belong_to :invoice }
end
