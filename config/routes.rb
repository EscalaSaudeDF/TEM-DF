Rails.application.routes.draw do
  
  root 'home#index'
  match 'home', controller: 'home', action: 'index', via: 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  match 'medics/results', controller: 'medics', action: 'results', via: 'get'
  
  get "edit_password" => "users#edit_password", :as => "edit_password"
  get "users/updatePassword" => "users#updatePassword"
  
  get "login" => "sessions#new", :as => "login"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "desactivate_account" => "users#desactivate", :as => "desactivate_account"
  
  get 'users/index'
  get 'users/new'

  post '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'

  patch '/users/:id', to: 'users#update'

  #resources :home
  resources :users
  resources :sessions

end
