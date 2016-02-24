class Api::V1::Items::ItemsBestDaysController < Api::ApiController
  respond_to :json

  def show
    respond_with ({best_day: Item.find(params[:id]).best_day})
  end
end
