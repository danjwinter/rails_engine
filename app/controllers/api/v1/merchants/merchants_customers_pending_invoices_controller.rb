class Api::V1::Merchants::MerchantsCustomersPendingInvoicesController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.find(params[:id]).pending_invoices_customers
  end
end
