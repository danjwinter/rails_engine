class Api::V1::ItemsController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.find(params[:id])
  end

  def index
    respond_with Item.all
  end
end
