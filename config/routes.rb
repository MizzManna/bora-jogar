Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pages
  resources :fields do
    resources :bookings, only: [:new, :create, :show]
  end
    # resources :bookings, only: [:show]
end
