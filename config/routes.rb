Rails.application.routes.draw do
  
  root 'home#index'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get "/users/:id/edit_password" => "users#edit_password", :as => "edit_password"
  patch "/users/:id/edit_password/updatePassword", to: "users#updatePassword"
  
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "desactivate_account" => "users#desactivate", :as => "desactivate_account"
  
  get 'users/index'
  get 'users/new'

  post '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'

  patch '/users/:id', to: 'users#update'

  resources :users do
    put :updatePassword, on: :member
  end
  resources :sessions
  resources :home

end
