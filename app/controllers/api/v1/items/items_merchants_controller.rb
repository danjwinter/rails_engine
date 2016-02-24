class Api::V1::Items::ItemsMerchantsController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.find(params[:id]).merchant
  end
end
