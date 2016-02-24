class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope { order('id ASC')}

  def self.highest_revenue_items(quantity)
    invoices = Invoice.paid.joins(:invoice_items).select("invoice_items.item_id, sum(invoice_items.quantity * invoice_items.unit_price) AS invoice_revenue").group("invoice_items.item_id").order("invoice_revenue DESC").first(quantity)
    invoices.map do |invoice|
        Item.find(invoice.item_id)
    end
  end

  def self.most_quantity_sold(quantity)
    invoices = Invoice.paid.joins(:invoice_items).select("invoice_items.item_id, sum(invoice_items.quantity) AS item_quantity").group("invoice_items.item_id").order("item_quantity DESC").first(quantity)
    invoices.map do |invoice|
        Item.find(invoice.item_id)
    end
  end

  def best_day
    Invoice.paid.joins(:invoice_items).where("invoice_items.item_id = #{id}").select("invoices.created_at, sum(invoice_items.quantity) AS daily_sum").group("invoices.created_at").order("daily_sum DESC").first.created_at 
  end

end





# Invoice.paid.joins(:invoice_items).select("invoice_items.items_id, sum(invoice_items.quantity * invoice_items.unit_price) AS invoice_revenue").group("invoices.merchant_id").order("invoice_revenue DESC").first(quantity)
