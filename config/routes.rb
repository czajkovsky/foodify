Foodify::Application.routes.draw do

  devise_for :users
  resources :users
  resources :clients, controller: 'users'
  resources :spots
  resources :cooks, controller: 'users'
  resources :waiters, controller: 'users'


  post '/join_spot', to: "spots#assign_to_client"
  root to: 'main#index'

end
