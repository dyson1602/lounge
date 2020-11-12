Rails.application.routes.draw do

  # root 'application#welcome'

  resources :comments
  resources :posts
  resources :users

  get '/login', to: 'sessions#new', as: 'new_login'
  get '/home', to: 'sessions#index', as: 'login'

  post '/sessions', to: 'sessions#create', as: 'login_now'
  
  delete '/logout', to: 'sessions#logout', as: 'logout'
  
  get '/mod1_articles', to: 'contents#mod1_articles', as: 'mod1_articles'
  get '/mod1_videos', to: 'contents#mod1_videos', as: 'mod1_videos'
  
  get '/mod2_articles', to: 'contents#mod2_articles', as: 'mod2_articles'
  get '/mod2_videos', to: 'contents#mod2_videos', as: 'mod2_videos' 
  
  get '/mod3_articles', to: 'contents#mod3_articles', as: 'mod3_articles'
  get '/mod3_videos', to: 'contents#mod3_videos', as: 'mod3_videos'

  get '/mod4_articles', to: 'contents#mod4_articles', as: 'mod4_articles'
  get '/mod4_videos', to: 'contents#mod4_videos', as: 'mod4_videos'

  get '/mod5_articles', to: 'contents#mod5_articles', as: 'mod5_articles'
  get '/mod5_videos', to: 'contents#mod5_videos', as: 'mod5_videos'
end
