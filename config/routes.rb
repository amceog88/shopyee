Rails.application.routes.draw do
  devise_for :users

  root "products#index"

  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
      post :remove_from_cart
      post :adjust_item
    end
  end
  
  resource :cart
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    root "products#index"
  end

end
