Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'entry#index'
  get '/show', to: 'event#show'
  get '/index', to: 'event#index'
end
