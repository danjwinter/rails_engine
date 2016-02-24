# require 'rails_helper'
#
# describe Api::V1::Invoices::InvoicesItemsController do
#   describe "GET#index", type: :controller do
#     before(:each) do
#       @invoice = create(:invoice, name: "Bob Frank")
#     end
#
#     it "returns the correct invoice with the find and id parameter" do
#       3.times { @invoice.items << create(:item) }
#       first_item = @invoice.items.first
#
#       get :index, format: :json, id: @invoice.id
#       invoices_response = json_response
#
#       expect(invoices_response.count).to eq 3
#       expect(invoices_response.first[:id]).to eq first_item.id
#     end
#   end
# end
