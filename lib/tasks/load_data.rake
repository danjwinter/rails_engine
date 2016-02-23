require 'csv'

desc "Load data"
task :load_data => :environment do
  # @csv = CSV.read("./vendor/assets/data/customers.csv", {headers: true, header_converters: :symbol}).map {|row| row.to_h}

  file = "vendor/customers.csv"
  CSV.foreach(file, :headers => true) do |row|
    Customer.create! row.to_h
  end
  file = "vendor/merchants.csv"
  CSV.foreach(file, :headers => true) do |row|
    Merchant.create! row.to_h
  end
  file = "vendor/items.csv"
  CSV.foreach(file, :headers => true) do |row|
    Item.create! row.to_h
  end
  file = "vendor/invoices.csv"
  CSV.foreach(file, :headers => true) do |row|
    Invoice.create! row.to_h
  end
  file = "vendor/invoice_items.csv"
  CSV.foreach(file, :headers => true) do |row|
    InvoiceItem.create! row.to_h
  end
  file = "vendor/transactions.csv"
  CSV.foreach(file, :headers => true) do |row|
    Transaction.create! row.to_h
  end
end
