Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :campsites do
    resources :bookings, only: [:new]
  end
  resources :bookings, only: [:create, :update, :destroy]
  get '/my_account', to: 'users#show', as: 'my_account'
end
