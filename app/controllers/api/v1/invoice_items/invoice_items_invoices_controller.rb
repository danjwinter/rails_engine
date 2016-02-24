class Api::V1::InvoiceItems::InvoiceItemsInvoicesController < Api::ApiController
  respond_to :json

  def show
    respond_with InvoiceItem.find(params[:id]).invoice
  end
end
