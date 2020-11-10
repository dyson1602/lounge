Rails.application.routes.draw do

  # root 'application#welcome'

  resources :post_comments
  resources :comments
  resources :posts
  resources :users

  get 'login', to: 'sessions#new', as: 'new_login'
  post '/sessions', to: 'sessions#create', as: 'login'
  
  delete '/logout', to: 'sessions#logout', as: 'logout'
end
