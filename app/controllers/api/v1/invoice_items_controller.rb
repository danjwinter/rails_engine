class Api::V1::InvoiceItemsController < Api::ApiController
  respond_to :json

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def index
    respond_with InvoiceItem.all
  end
end
