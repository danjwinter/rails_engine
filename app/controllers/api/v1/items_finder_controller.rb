class Api::V1::ItemsFinderController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.where(item_params).take
  end

  def index
    respond_with Item.where(item_params)
  end

  private

  def item_params
    params.permit(:name,
                  :description,
                  :unit_price,
                  :merchant_id,
                  :created_at,
                  :updated_at,
                  :id)
  end

  # def db_adjusted_params
  #   adjusted_params = item_params.dup
  #   if item_params[:unit_price]
  #     adjusted_params[:unit_price] = (item_params[:unit_price].to_f * 100).round
  #   end
  #   adjusted_params
  # end
end
