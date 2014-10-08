Rails.application.routes.draw do

  get "/users/:id/edit_password" => "users#edit_password", :as => "edit_password"
  patch "/users/:id/edit_password/updatePassword", to: "users#updatePassword"
  
  get "login" => "sessions#new", :as => "login"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "desactivate_account" => "users#desactivate", :as => "desactivate_account"
  
  get 'users/index'
  get 'users/new'

  post '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'

  patch '/users/:id', to: 'users#update'


  root 'index#index'

  resources :users do
    put :updatePassword, on: :member
  end
  resources :sessions

end
