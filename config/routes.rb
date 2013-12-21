Foodify::Application.routes.draw do

  devise_for :users
  resources :users
  resources :clients, controller: 'users'
  resources :spots
  resources :cooks, controller: 'users'
  resources :waiters, controller: 'users'

  root to: 'main#index'

end
