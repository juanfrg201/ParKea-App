Rails.application.routes.draw do
  get 'charts/export_to_pdf'
  get 'exports/export_to_excel_parking'
  get 'exports/export_to_excel_booking'
  get 'booking/index'
  get 'booking/create'
  get 'booking/destroy'
  get 'booking/enable'
  get 'booking/disable'
  get 'booking/new'
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
      get :report 
      get :statistics
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

  resources :fidelities, only: [:index, :create, :destroy] do
    collection do
      patch :enable
      patch :disable
    end
  end

  resources :bookings do 
    collection do
      get :reserve_index
      patch :enable
      patch :disable
    end
  end

  resources :client_cars


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
