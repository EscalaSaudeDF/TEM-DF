Rails.application.routes.draw do
  
  root 'home#index'
  match 'home', controller: 'home', action: 'index', via: 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  match 'medics/results', controller: 'medics', action: 'results', via: 'get'
  match 'medics/rating', controller: 'medics', action: 'rating', via: 'post'
  get "/medics/profile/:id" => "medics#profile", :as => "profile"
  
  get "/users/:id/edit_password" => "users#edit_password", :as => "edit_password"
  patch "/users/:id/edit_password/update_password", to: "users#update_password"
  
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "desactivate_account" => "users#desactivate", :as => "desactivate_account"
  get "/users/:id/reactivate_account" => "users#reactivate", :as => "reactivate_account"
  get "/users/:id/desactivate_account" => "users#desactivate", :as => "desactivate_account_admin"
  post "/upload", controller: 'parsers', action: 'upload'

  post "/parsers", controller: 'parsers', action: 'index', :as => "index_parser"
  
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
  resources :parsers

end
