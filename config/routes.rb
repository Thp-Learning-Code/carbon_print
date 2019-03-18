Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :foot_prints, only: [:show, :edit]
  resources :product do
    resources :foot_prints, only: [:new, :create]
  end

  require 'open-uri'
  resources :api, only: [:index]
  puts response = open('https://api.airvisual.com/v2/city?city=Paris&state=Ile-de-France&country=France&key=QNrwyZP6F7oa3Bxog').read

end
