require 'csv'

desc "Load data"
task :load_data => :environment do
  @csv = CSV.read("./vendor/assets/data/customers.csv", {headers: true, header_converters: :symbol}).map {|row| row.to_h}
  byebug
end
