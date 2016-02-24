class Api::V1::MerchantsFinderController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.where(merchant_params).take
  end

  def index
    respond_with Merchant.where(merchant_params)
  end

  private

  def merchant_params
    params.permit(:name,
                  :created_at,
                  :updated_at,
                  :id)
  end
end
