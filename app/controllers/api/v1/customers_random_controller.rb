class Api::V1::CustomersRandomController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.unscoped.limit(1).order("RANDOM()")
  end
end
