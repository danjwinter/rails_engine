FactoryGirl.define do
  factory :item do
    name "Rake"
    description "Rakes on rakes on rakes"
    unit_price 2500
    association :merchant
  end
end
