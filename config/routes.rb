Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  # Registration
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  # User Profile
  get '/profile', to: 'users#show'
end
