class Api::V1::Items::ItemsRevenuesController < Api::ApiController
  respond_to :json

  def index
    respond_with Item.highest_revenue_items(params[:quantity])
  end
end
