class Api::V1::Items::ItemsSalesController < Api::ApiController
  respond_to :json

  def index
    respond_with Item.most_quantity_sold(params[:quantity])
  end
end
