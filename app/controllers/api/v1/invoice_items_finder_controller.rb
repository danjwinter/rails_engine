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

  # def db_adjusted_params
  #   adjusted_params = invoice_item_params.dup
  #   if invoice_item_params[:unit_price]
  #     adjusted_params[:unit_price] = invoice_item_params[:unit_price].to_f * 100
  #   end
  #   adjusted_params
  # end
end
