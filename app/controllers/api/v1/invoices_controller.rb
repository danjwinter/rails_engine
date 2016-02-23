class Api::V1::InvoicesController < Api::ApiController
  respond_to :json

  def show
    respond_with Invoice.find(params[:id])
  end

  def index
    respond_with Invoice.all
  end
end
