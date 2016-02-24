class Api::V1::Invoices::InvoicesTransactionsController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoice.find(params[:id]).transactions
  end
end
