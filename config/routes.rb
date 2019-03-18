Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
  root to: 'home#index'
  resources :foot_prints, only: [:show, :edit]
  resources :product do
    resources :foot_prints, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
