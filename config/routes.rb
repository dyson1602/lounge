Rails.application.routes.draw do

  # root '/', to: 'users#index'
  #whats wrong here?

  resources :post_comments
  resources :comments
  resources :posts
  resources :users

  get 'login', to: 'sessions#new', as: 'new_login'
  post '/sessions', to: 'sessions#create', as: 'login'
  
end
