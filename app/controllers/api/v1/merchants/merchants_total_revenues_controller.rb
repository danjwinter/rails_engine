class Api::V1::Merchants::MerchantsTotalRevenuesController < Api::ApiController
  respond_to :json

  def show
    respond_with ({ total_revenue: Invoice.total_revenue_by_date(params[:date]) })
  end
end
