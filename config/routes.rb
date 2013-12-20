Foodify::Application.routes.draw do

  devise_for :users
  resources :users

  match 'users/:id', to: 'users#destroy', via: :delete, as: :admin_destroy_user

  root to: 'main#index'

end
