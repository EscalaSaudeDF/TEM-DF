Rails.application.routes.draw do

  get "login" => "sessions#index", :as => "login"
  get "log_out" => "sessions#destroy", :as => "log_out"

  get 'users/index'
  get 'users/new'

  post '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'

  patch '/users/:id', to: 'users#update'

  root 'index#index'

  resources :users
  resources :sessions

end

