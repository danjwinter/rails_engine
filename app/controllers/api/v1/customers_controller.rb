class Api::V1::CustomersController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.find(params[:id])
  end

  def index
    respond_with Customer.all
  end

  def find
    respond_with Customer.where(customer_params).take

    # customer_params.each_with_index do |key_value, index|
    #   if index == 0
    #     if params_needing_downcase.include?(key_value[0])
    #       @query = Customer.where("#{key_value[0]} ilike ?", key_value[1])
    #     else
    #       @query = Customer.where(key_value[0] => key_value[1])
    #     end
    #   else
    #     if params_needing_downcase.include?(key_value[0])
    #       @query = @query.where("#{key_value[0]} ilike ?", key_value[1])
    #     else
    #       @query.where(key_value[0] => key_value[1])
    #     end
    #   end
    # end
    # respond_with @query.take
  end

  private

  def customer_params
    params.permit(:first_name,
                  :last_name,
                  :created_at,
                  :updated_at,
                  :id)
  end

  def params_needing_downcase
    %w(first_name last_name)
  end

  def search_attribute
    request.query_string.split("=").first
  end

  def search_parameter
    request.query_string.split("=").last
  end

  def is_number? string
    true if Float(string) rescue false
  end
end
