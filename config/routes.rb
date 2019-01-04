Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resources :restaurants, only: [:index, :new, :create, :destroy]
  resources :sessions, only: [:new, :create]
  post '/logout', to: 'sessions#logout', as: 'logout'
end
