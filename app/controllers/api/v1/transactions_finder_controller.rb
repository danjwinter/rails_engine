class Api::V1::TransactionsFinderController < Api::ApiController
  respond_to :json

  def show
    respond_with Transaction.where(transaction_params).take
  end

  def index
    respond_with Transaction.where(transaction_params)
  end

  private

    def transaction_params
      params.permit(:credit_card_number,
                    :invoice_id,
                    :credit_card_expiration_date,
                    :result,
                    :created_at,
                    :updated_at,
                    :id)
  end
end
