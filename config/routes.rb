Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :merchants, only: [:show, :index] do
        member do
          get :items, to: "merchants/merchants_items#index"
          get :invoices, to: "merchants/merchants_invoices#index"
        end
        collection do
          get :find, to: "merchants_finder#show"
          get :find_all, to: "merchants_finder#index"
          get :random, to: "merchants_random#show"
        end
      end
      resources :customers, only: [:show, :index] do
        member do
          get :invoices, to: "customers/customers_invoices#index"
          get :transactions, to: "customers/customers_transactions#index"
        end
        collection do
          get :find, to: "customers_finder#show"
          get :find_all, to: "customers_finder#index"
          get :random, to: "customers_random#show"
        end
      end
      resources :items, only: [:show, :index] do
        member do
          get :invoice_items, to: "items/items_invoice_items#index"
          get :merchant, to: "items/items_merchants#show"
        end
        collection do
          get :find, to: "items_finder#show"
          get :find_all, to: "items_finder#index"
          get :random, to: "items_random#show"
        end
      end
      resources :invoices, only: [:show, :index] do
        member do
          get :items, to: "invoices/invoices_items#index"
          get :transactions, to: "invoices/invoices_transactions#index"
          get :invoice_items, to: "invoices/invoices_invoices_items#index"
          get :customer, to: "invoices/invoices_customers#show"
          get :merchant, to: "invoices/invoices_merchants#show"
        end
        collection do
          get :find, to: "invoices_finder#show"
          get :find_all, to: "invoices_finder#index"
          get :random, to: "invoices_random#show"
        end
      end
      resources :invoice_items, only: [:show, :index] do
        member do
          get :invoice, to: "invoice_items/invoice_items_invoices#show"
          get :item, to: "invoice_items/invoice_items_items#show"
        end
        collection do
          get :find, to: "invoice_items_finder#show"
          get :find_all, to: "invoice_items_finder#index"
          get :random, to: "invoice_items_random#show"
        end
      end
      resources :transactions, only: [:show, :index]do
        member do
          get :invoice, to: "transactions/transactions_invoices#show"
        end
        collection do
          get :find, to: "transactions_finder#show"
          get :find_all, to: "transactions_finder#index"
          get :random, to: "transactions_random#show"
        end
      end
    end
  end
end
