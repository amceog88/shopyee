Rails.application.routes.draw do
  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root "products#index"
  end

end
