class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  before_save :convert_price_to_dollars

  default_scope { order('id ASC')}

  def convert_price_to_dollars
    self.unit_price = self.unit_price / 100.00
  end
end
