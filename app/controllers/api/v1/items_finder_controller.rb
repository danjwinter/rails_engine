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
end
