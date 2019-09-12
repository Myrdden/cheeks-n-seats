Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'event#index'
  get '/index', to: 'event#index'
  get '/show', to: 'event#show'


  # Authentication
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # User Profile
  get '/profile', to: 'users#show'

  # Text Confirmation
  get '/text', to: 'text#show'
end
