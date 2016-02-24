require 'csv'

desc "Load data"
task :load_data => :environment do
  # @csv = CSV.read("./vendor/assets/data/customers.csv", {headers: true, header_converters: :symbol}).map {|row| row.to_h}

  file = "./vendor/assets/data/customers.csv"
  CSV.foreach(file, :headers => true) do |row|
    Customer.create! row.to_h
  end
  file = "./vendor/assets/data/merchants.csv"
  CSV.foreach(file, :headers => true) do |row|
    Merchant.create! row.to_h
  end
  file = "./vendor/assets/data/items.csv"
  CSV.foreach(file, :headers => true) do |row|
    Item.create(
                name: row[1],
                description: row[2],
                unit_price: (row[3].to_f / 100.00),
                merchant_id: row[4],
                created_at: row[5],
                updated_at: row[6]
    )
  end
  file = "./vendor/assets/data/invoices.csv"
  CSV.foreach(file, :headers => true) do |row|
    Invoice.create! row.to_h
  end
  file = "./vendor/assets/data/invoice_items.csv"
  CSV.foreach(file, :headers => true) do |row|
    InvoiceItem.create(
                       :item_id    => row[1],
                       :invoice_id => row[2],
                       :quantity   => row[3],
                       :unit_price => (row[4].to_f / 100),
                       :created_at => row[5],
                       :updated_at => row[6]
        )
  end
  file = "./vendor/assets/data/transactions.csv"
  CSV.foreach(file, :headers => true) do |row|
    Transaction.create! row.to_h
  end
end
