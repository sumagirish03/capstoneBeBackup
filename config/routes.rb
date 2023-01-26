Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "application#landing"

  resources :account
  resources :profile
  resources :login
  resources :logout
  resources :jobs
  resources :appliedjobs
  resources :eligiblejobs
  resources :create
  resources :delete
  resources :update

end
