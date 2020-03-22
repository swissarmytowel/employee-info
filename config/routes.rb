Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/login',  to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  post '/login',  to: 'sessions#create'

  resources :users
end
