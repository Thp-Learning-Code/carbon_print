Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
  root to: 'home#index'
  resources :foot_prints, only: [:show, :edit]
  resources :product do
    resources :foot_prints, only: [:new, :create]
  end

  require 'open-uri'
  resources :api, only: [:index]

end
