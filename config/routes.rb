Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup',  to: 'users#new'
  get '/login',   to: 'sessions#new'
  get '/logout',  to: 'sessions#destroy'
  get '/create',  to: 'employees#new'
  
  post '/login',  to: 'sessions#create'
  post '/create',  to: 'employees#create'
  
  resources :users
  resources :employees
end
