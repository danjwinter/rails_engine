class Api::V1::Merchants::MerchantsRevenuesController < Api::ApiController
  respond_to :json

  def show
    if params[:date]
      respond_with ({revenue: Merchant.find(params[:id]).revenue_by_date(params[:date])})
    else
      respond_with ({revenue: Merchant.find(params[:id]).revenue})
    end
  end

  def index
    respond_with Merchant.top_revenue(params[:quantity])
  end
end
