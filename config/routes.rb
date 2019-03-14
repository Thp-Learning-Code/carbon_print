Rails.application.routes.draw do
  get 'product/index'
  get 'product/show'
  devise_for :users
  resources :foot_prints
  root to: 'home#index'
  resources :product

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
