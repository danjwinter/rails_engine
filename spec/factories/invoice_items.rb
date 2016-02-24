FactoryGirl.define do
  factory :invoice_item do
    association :item
    association :invoice
    quantity 1
    unit_price 5.00
  end
end
