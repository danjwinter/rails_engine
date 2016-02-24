class Api::V1::InvoicesFinderController < Api::ApiController
  respond_to :json

  def show
    respond_with Invoice.where(invoice_params).take
  end

  def index
    respond_with Invoice.where(invoice_params)
  end

  private

    def invoice_params
      params.permit(:customer_id,
                    :merchant_id,
                    :status,
                    :created_at,
                    :updated_at,
                    :id)
  end
end
