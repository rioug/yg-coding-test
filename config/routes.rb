Rails.application.routes.draw do
  resources :shopping_carts, only: [:show] do
    resources :products, controller: 'shopping_carts/products', only: [:update, :destroy]
  end
  resources :products
  root to: 'root#index'

  resources :retailers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
