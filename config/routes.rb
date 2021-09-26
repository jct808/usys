Rails.application.routes.draw do
  get "search_suppliers/index"
  root to: "products#index"
  devise_for :users

  get "products/indx_table", to: 'products#index_table'

  resources :users
  resources :products do
    get :autocomplete_supplier_name, on: :collection
  end

  resources :categories
  resources :suppliers
  resources :locations
  resources :orders

  namespace :api do
    namespace :v1 do
      resources :sessions, :only => [:create, :destroy]
      resources :products
    end
  end
  

end
