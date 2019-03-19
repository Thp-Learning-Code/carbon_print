Rails.application.routes.draw do
  resources :user, only: [:show]
  devise_for :users
  root to: 'home#index'
  resources :footprints, only: [:show, :edit]
  resources :product do
    resources :footprints, only: [:new, :create]
  end

  require 'open-uri'
  resources :api, only: [:index]

end
