Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'entry#index'
  get '/index', to: 'event#index'
  get '/show', to: 'event#show'
  get '/search', to: 'search#index'
end
