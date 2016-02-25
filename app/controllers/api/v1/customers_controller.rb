class Api::V1::CustomersController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.find(params[:id])
  end

  def index
    respond_with Customer.all
  end

  def find
    respond_with Customer.where(customer_params).take
  end

  private

  def customer_params
    params.permit(:first_name,
                  :last_name,
                  :created_at,
                  :updated_at,
                  :id)
  end
end
