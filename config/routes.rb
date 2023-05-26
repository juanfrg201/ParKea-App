Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  root to: "welcome_page#index"

  resources :creditcards, only: [:new, :create, :index, :destroy]

  resources :parkings, only: [:new, :create, :update, :destroy, :index] do
    collection do
      patch :enable
      patch :disable
    end
  end

  resources :parking_types, only: [:new, :create, :destroy] do
    collection do
      patch :enable
      patch :disable
    end
  end

  resources :city_parking, only: [:new, :create, :destroy] do
    collection do
      patch :enable
      patch :disable
    end
  end

  resources :admin , only: [:new , :index, :create, :destroy, :update] do
    collection do
      patch :enable
      patch :disable
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
