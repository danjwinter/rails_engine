class Api::V1::Customers::CustomersFavoriteMerchantsController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.find(params[:id]).favorite_merchant
  end
end
