class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  scope :successful_transactions, -> { joins(:transactions).where(transactions: { result: "success" })}

  def rev
    invoices.paid.joins(:invoice_items).sum("quantity * unit_price")
  end
end
