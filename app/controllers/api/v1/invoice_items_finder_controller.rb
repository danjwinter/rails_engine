class Api::V1::InvoiceItemsFinderController < Api::ApiController
  respond_to :json

  def show
    respond_with InvoiceItem.where(invoice_item_params).take
  end

  def index
    respond_with InvoiceItem.where(invoice_item_params)
  end

  private

    def invoice_item_params
      params.permit(:item_id,
                    :invoice_id,
                    :quantity,
                    :unit_price,
                    :created_at,
                    :updated_at,
                    :id)
  end
end
