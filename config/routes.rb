Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :campsites do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:update, :destroy] do
    resources :reviews, only: [:create]
  end
  get '/my_account/:id', to: 'users#show', as: 'my_account'
end
