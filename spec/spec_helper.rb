require 'factory_girl_rails'
require_relative 'support/request_helpers'
require 'simplecov'
SimpleCov.start 'rails'

def json_response
  JSON.parse(response.body, symbolize_names: true)
end

RSpec.configure do |config|

config.before(:each) do
  DatabaseCleaner.start
end

config.after(:each) do
  DatabaseCleaner.clean
end


config.before(:suite) do
  DatabaseCleaner.clean_with(:truncation)
end

config.before(:each) do
  DatabaseCleaner.strategy = :transaction
end

config.before(:each, :js => true) do
  DatabaseCleaner.strategy = :truncation
end

config.before(:each) do
  DatabaseCleaner.start
end

config.after(:each) do
  DatabaseCleaner.clean
end
  config.include FactoryGirl::Syntax::Methods

  config.include Request::JsonHelpers, :type => :controller

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
