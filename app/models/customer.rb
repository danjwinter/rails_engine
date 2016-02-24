class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.find_multiple_params(customer_params)
    customer_params.each_with_index do |key_value, index|
      if index == 0
        if params_needing_downcase.include?(key_value[0])
          @query = where("#{key_value[0]} ilike ?", key_value[1])
        else
          @query = where(key_value[0] => key_value[1])
        end
      else
        if params_needing_downcase.include?(key_value[0])
          @query = @query.where("#{key_value[0]} ilike ?", key_value[1])
        else
          @query.where(key_value[0] => key_value[1])
        end
      end
    end
  end
end
