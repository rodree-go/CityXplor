Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/destroy'
  devise_for :users
  root to: "pages#home"
  resources :experiences do
    resources :reviews, only: [:create, :destroy]
    resources :bookings, only: [:new, :create, :index, :show]
  end
  resources :bookings, only: [:edit, :destroy, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
