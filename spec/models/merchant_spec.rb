require 'spec_helper'

RSpec.describe Merchant, type: :model do
  before { @merchant = build(:merchant)}

  subject { @merchant }

  it { should respond_to(:name) }
  it { should be_valid }
end
