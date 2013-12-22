Foodify::Application.routes.draw do

  devise_for :users
  resources :users
  resources :clients, controller: 'users'
  resources :spots do
    resources :orders
  end
  resources :cooks, controller: 'users'
  resources :waiters, controller: 'users'
  resources :items

  root to: 'dashboard#index'

  get 'no_privileges', to: 'pages#no_privileges'

  put '/spots/:id/join(.:format)', to: 'spots#assign_to_client', as: 'join_spot'
  put '/spots/:id/close(.:format)', to: 'spots#close', as: 'close_spot'
  put '/spots/:id/handle(.:format)', to: 'spots#handle', as: 'handle_spot'

  put '/spots/:spot_id/orders/:id/send(.:format)', to: 'orders#send_to_kitchen', as: 'send_order'

  get 'kitchen', to: 'orders#kitchen'

end
