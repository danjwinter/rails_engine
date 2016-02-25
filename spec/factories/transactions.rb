FactoryGirl.define do
  factory :transaction do
    association :invoice
    credit_card_number "9830298439028409"
    credit_card_expiration_date Time.now
    result "success"
  end
end
