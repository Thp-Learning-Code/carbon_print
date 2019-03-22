Rails.application.routes.draw do

  get 'methodologie/index'
  get 'contact/index'
  root to: 'home#index'

  resources :user, only: [:show]
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  } 
  
  resources :footprints, only: [:show, :edit]
  resources :product do
    resources :footprints, only: [:new, :create]
  end

  namespace :admin do
    root :to=> 'admin#index'
    resources :users , except: [:new , :create, :edit]
    resources :products 
    resources :foot_prints , except: [:edit, :new, :update]
  end

resource :contact , only: [:index]
resource :methodologie , only: [:index]

  # get "*path" => redirect("/")# A decommenter vers la fin

end
