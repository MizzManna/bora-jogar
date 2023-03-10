Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pages
  resources :fields do
    resources :bookings, only: [:new, :create]
  end
    resources :bookings, only: [:show]
    resources :users, only: [:show]
end
