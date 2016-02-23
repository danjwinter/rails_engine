require 'rails_helper'

RSpec.describe Customer, type: :model do
  before { @customer = build(:customer)}

  subject { @customer }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should be_valid }
end
