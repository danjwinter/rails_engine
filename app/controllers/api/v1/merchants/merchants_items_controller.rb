class Api::V1::Merchants::MerchantsItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.find(params[:id]).items
  end
end
