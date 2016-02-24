class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  scope :paid, -> { joins(:transactions).where(transactions: {result: "success"}) }
end

# Merchant.joins(:transactions).where(transactions: { result: "success" }).find(1)
