class Api::V1::Merchants::MerchantsMostItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.top_selling_merchants(params[:quantity])
  end
end
