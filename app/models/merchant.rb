class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  scope :successful_transactions, -> { joins(:invoices).joins(:transactions).where(transactions: { result: "success" })}

  def revenue
    invoices.paid.joins(:invoice_items).sum("quantity * unit_price")
  end

  def revenue_by_date(date)
    invoices.paid.by_date(date).joins(:invoice_items).sum("quantity * unit_price")
  end

  def favorite_customer
    favorite_customer_id = invoices.paid.favorite_customers.first.customer_id
    Customer.find(favorite_customer_id)
  end

  def pending_invoices_customers
    Customer.find(invoices.pending.pluck(:customer_id))
  end

  def self.top_revenue(quantity)
    merchant_ids = Invoice.paid.joins(:invoice_items).select("merchant_id, sum(invoice_items.quantity * invoice_items.unit_price) AS invoice_revenue").group("invoices.merchant_id").order("invoice_revenue DESC").first(quantity)
    merchant_ids.map do |invoice|
      Merchant.find(invoice.merchant_id)
    end
  end

  def self.top_selling_merchants(quantity)
    top_sellers = Invoice.paid.joins(:invoice_items).select("merchant_id, sum(invoice_items.quantity) AS total_items_sold").group("invoices.merchant_id").order("total_items_sold DESC").first(quantity)
    top_sellers.map do |sales|
      Merchant.find(sales.merchant_id)
    end
  end
end
