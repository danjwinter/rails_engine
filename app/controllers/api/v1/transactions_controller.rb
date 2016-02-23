class Api::V1::TransactionsController < Api::ApiController
  respond_to :json

  def show
    respond_with Transaction.find(params[:id])
  end

  def index
    respond_with Transaction.all
  end
end
