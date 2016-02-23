FactoryGirl.define do
  factory :invoice do
    association :customer
    association :merchant
    status "complete"
  end
end
