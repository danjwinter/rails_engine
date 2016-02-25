class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  scope :paid, -> { joins(:transactions).where(transactions: {result: "success"}) }
  scope :pending, -> {joins(:transactions).where(transactions: {result: "failed"})}
  scope :by_date, -> (date) { where(created_at: date ) }
  scope :favorite_customers, -> { select("customer_id,
                                          count(customer_id) AS customer_count").group("invoices.customer_id")
                                                                                .order("customer_count DESC") }
  scope :favorite_merchants, -> { select("merchant_id,
                                         count(merchant_id) AS merchant_count").group("invoices.merchant_id")
                                                                               .order("merchant_count DESC") }
  scope :total_revenue_by_date, -> (date) { paid.where(created_at: date)
                                                .joins(:invoice_items)
                                                .sum("invoice_items.quantity * invoice_items.unit_price")
                                                .to_s }
end
