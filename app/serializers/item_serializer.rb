class ItemSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  attributes :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

end
