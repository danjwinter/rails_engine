class Api::V1::InvoiceItems::InvoiceItemsItemsController < Api::ApiController
  respond_to :json

  def show
    respond_with InvoiceItem.find(params[:id]).item
  end
end
