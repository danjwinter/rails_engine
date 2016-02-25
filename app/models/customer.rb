class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    favorite_merchant_id = invoices.paid.favorite_merchants.first.merchant_id
    Merchant.find(favorite_merchant_id)
  end
end
