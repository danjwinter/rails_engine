class Api::V1::CustomersController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.find(params[:id])
  end

  def index
    respond_with Customer.all
  end

  def find
    if is_number? search_parameter
      respond_with Customer.where(item_params).take
    else
      respond_with Customer.where("lower(#{search_attribute}) LIKE ?", "%#{search_parameter.downcase}").take
    end
  end

  def find_all
    if is_number? search_attribute
      respond_with Customer.where(item_params)
    else
      respond_with Customer.where("lower(#{search_attribute}) LIKE ?", "%#{search_parameter.downcase}")
    end
  end

  def random
    respond_with Customer.limit(1).order("RANDOM()")
  end

  private

  def item_params
    params.permit(:first_name,
                  :last_name,
                  :created_at,
                  :updated_at)
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
