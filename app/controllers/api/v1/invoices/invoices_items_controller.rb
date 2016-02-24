class Api::V1::Invoices::InvoicesItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoice.find(params[:id]).items
  end
end
