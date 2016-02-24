class Api::V1::InvoiceItemsController < Api::ApiController
  respond_to :json

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def index
    respond_with InvoiceItem.all
  end
  # 
  # def find
  #   respond_with InvoiceItem.where(invoice_item_params).take
  # end
  #
  # def find_all
  #   respond_with InvoiceItem.where(invoice_item_params)
  # end
  #
  # def random
  #   respond_with InvoiceItem.limit(1).order("RANDOM()")
  # end
  #
  # private
  #
  #   def invoice_item_params
  #     params.permit(:item_id,
  #                   :invoice_id,
  #                   :quantity,
  #                   :unit_price,
  #                   :created_at,
  #                   :updated_at,
  #                   :id)
  # end
end
