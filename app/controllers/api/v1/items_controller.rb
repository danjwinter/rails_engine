class Api::V1::ItemsController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.find(params[:id])
  end

  def index
    respond_with Item.all
  end

  def find
    if params_needing_downcase.include?(search_attribute)
      respond_with Item.where("lower(#{search_attribute}) LIKE ?", "%#{search_parameter.downcase}").take
    else
      respond_with Item.where(item_params).take
    end
  end

  def find_all
    if is_number? search_attribute
      respond_with Item.where(item_params)
    else
      respond_with Item.where("lower(#{search_attribute}) LIKE ?", "%#{search_parameter.downcase}")
    end
  end

  def random
    respond_with Item.limit(1).order("RANDOM()")
  end

  private

  def params_needing_downcase
    %w(name description)
  end

  def item_params
    params.permit(:name,
                  :description,
                  :unit_price,
                  :merchant_id,
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
