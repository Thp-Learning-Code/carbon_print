Rails.application.routes.draw do

  root to: 'home#index'

  resources :user, only: [:show]
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  } 
  
  resources :footprints, only: [:show, :destroy]
  resources :product do
    resources :footprints, only: [:new, :create]
  end

  require 'open-uri'
  resources :api, only: [:index]

end
