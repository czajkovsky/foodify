Foodify::Application.routes.draw do

  devise_for :users
  resources :users
  resources :clients, controller: 'users'
  resources :spots do
    resources :orders do
      resources :position
    end
  end

  resources :cooks, controller: 'users'
  resources :waiters, controller: 'users'
  resources :items

  root to: 'dashboard#index'

  get 'no_privileges', to: 'pages#no_privileges'
  get 'kitchen', to: 'orders#kitchen'

  put '/spots/:id/join(.:format)', to: 'spots#assign_to_client', as: 'join_spot'
  put '/spots/:id/close(.:format)', to: 'spots#close', as: 'close_spot'
  put '/spots/:id/handle(.:format)', to: 'spots#handle', as: 'handle_spot'

  put '/orders/:id/cook(.:format)', to: 'orders#cook', as: 'cook_order'
  put '/orders/:id/finish(.:format)', to: 'orders#finish', as: 'finish_order'
  put '/orders/:id/deliver(.:format)', to: 'orders#deliver', as: 'deliver_order'
  put '/spots/:spot_id/orders/:id/send(.:format)', to: 'orders#send_to_kitchen', as: 'send_order'

  post '/spots/:spot_id/orders/:order_id/position/add/:item_id(.:format)', to: 'position#add', as: 'add_position'


end
