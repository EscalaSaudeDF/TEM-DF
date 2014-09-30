Rails.application.routes.draw do

  get "login" => "sessions#new", :as => "login"
  get "log_out" => "sessions#destroy", :as => "log_out"

  get 'users/index'
  get 'users/new'

  post '/user/:id', to: 'users#show'
  post '/user/:id', to: 'users#edit'

  patch '/user/:id', to: 'users#update'

  root 'index#index'

  resources :users
  resources :sessions

end

