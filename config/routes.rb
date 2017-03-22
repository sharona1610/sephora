Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  match 'logout' => 'sessions#destroy', via: [:get, :delete]
  post 'products/search' => 'products#search', as: 'search_products'

  resources :users, only: [:edit, :update, :show]
end
