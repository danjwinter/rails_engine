class Api::V1::InvoicesFinderController < Api::ApiController
  respond_to :json

  def show
    respond_with Invoice.limit(1).order("RANDOM()")
  end
end
