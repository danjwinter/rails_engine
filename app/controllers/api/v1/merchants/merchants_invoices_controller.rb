class Api::V1::Merchants::MerchantsInvoicesController < Api::ApiController
  respond_to :json

  def index
    byebug
    respond_with Merchant.find(params[:id]).invoices
  end
end
