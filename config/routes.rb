Rails.application.routes.draw do
  
  get 'password_resets/new'

  root 'home#index'
  match 'home', controller: 'home', action: 'index', via: 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  match 'medics/results', controller: 'medics', action: 'results', via: 'get'
  match 'medics/rating', controller: 'medics', action: 'rating', via: 'post'
  match 'medics/create_comment', controller: 'medics', action: 'create_comment', via: 'post'
  match 'medics/create_relevance', controller: 'medics', action: 'create_relevance', via: 'post'
  get "/medics/profile/:id" => "medics#profile", :as => "profile"
  get "/workunits_graph" => "medics#workunits_graph", :as => "workunits_graph"
  get "/:id/quantity_medics_by_speciality" => "medics#quantity_medics_by_speciality", :as => "quantity_medics_by_speciality"

  get "/medics/profile/:id/create_relevance" => "medics#create_relevance", :as => "create_relevance"
  get "/medics/profile/:id/to_report" => "medics#to_report", :as => "to_report"

  get "/users/:id/edit_password" => "users#edit_password", :as => "edit_password"
  patch "/users/:id/edit_password/update_password", to: "users#update_password"
  
  get "/comments/reports", controller: 'comments', action: 'reports', :as => "reported_comments"
  get "/comments/reactivate_comment" => "comments#reactivate", :as => "reactivate_comment"
  get "/comments/deactivate_comment" => "comments#deactivate", :as => "deactivate_comment"
  get "/comments/disable_report" => "comments#disable_report", :as => "disable_report"
    
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "desactivate_account" => "users#desactivate", :as => "desactivate_account"
  get "/users/:id/reactivate_account" => "users#reactivate", :as => "reactivate_account"
  get "/users/:id/desactivate_account" => "users#desactivate", :as => "desactivate_account_admin"
  post "/upload", controller: 'parsers', action: 'upload'

  get "contact" => "contact#new", :as => "contact"

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
  resources :contact
  resources :password_resets

end
