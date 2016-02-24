FactoryGirl.define do
  factory :item do
    name "Rake"
    description "Rakes on rakes on rakes"
    unit_price 25.00
    association :merchant
  end
end
