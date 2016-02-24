class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  scope :paid, -> { joins(:transactions).where(transactions: {result: "success"}) }
  scope :pending, -> {joins(:transactions).where(transactions: {result: "failed"})}
  scope :by_date, -> (date) { where(created_at: date ) }
  # scope :highest_customer_count, -> { group(:customer_id).calculate(:count, :customer_id, group: "customer_id").max }
  scope :favorite_customers, -> { select("customer_id, count(customer_id) AS customer_count").group("invoices.customer_id").order("customer_count DESC") }
  scope :total_revenue_by_date, -> (date) { paid.where(created_at: date).joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price").to_s }
end
# (time) { where("created_at < ?", time)
# Merchant.joins(:transactions).where(transactions: { result: "success" }).find(1)
# Merchant.find(params[:id]).invoices.paid.group(:customer_id).calculate(:count, :customer_id, group: 'customer_id').max[0]
# invoices.paid.select("customer_id, count(customer_id) AS customer_count").group("invoices.customer_id").order("customer_count DESC").first


# top revenue
# Invoice.paid.joins(:invoice_items).select("merchant_id, sum(invoice_items.quantity * invoice_items.unit_price) AS invoice_revenue").group("invoices.merchant_id").order("invoice_revenue DESC").first.invoice_revenue
# Invoice.paid.where(created_at: params[:date]).joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price").to_f







# Item.find(params[:id]).invoices.paid.joins(:invoice_items).select("invoices.created_at, sum(invoice_items.quantity) AS daily_sum").group("invoices.created_at", order: "daily_sum DESC")
