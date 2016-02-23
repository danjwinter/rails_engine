Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :merchants, only: [:show, :index]
      resources :customers, only: [:show, :index]
      resources :items, only: [:show, :index] do
        collection do
          get :find
          get :find_all
          get :random
        end

      end
      resources :invoices, only: [:show, :index]
      resources :invoice_items, only: [:show, :index]
      resources :transactions, only: [:show, :index]
    end
  end
end
