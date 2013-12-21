Foodify::Application.routes.draw do

  resources :items


  devise_for :users
  resources :users
  resources :clients, controller: 'users'
  resources :spots
  resources :cooks, controller: 'users'
  resources :waiters, controller: 'users'
  resources :items

  root to: 'main#index'

  get 'no_privileges', to: 'pages#no_privileges'

  put '/spots/:id/join(.:format)', to: 'spots#assign_to_client', as: 'join_spot'
  put '/spots/:id/close(.:format)', to: 'spots#close', as: 'close_spot'
  put '/spots/:id/handle(.:format)', to: 'spots#handle', as: 'handle_spot'

end
