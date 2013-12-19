Foodify::Application.routes.draw do

  devise_for :users

  root to: 'main#index'

  get 'users/', to: 'users#index'

end
