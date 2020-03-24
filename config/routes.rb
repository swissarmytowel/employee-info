Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup',  to: 'users#new'
  get '/login',   to: 'sessions#new'
  get '/logout',  to: 'sessions#destroy'
  get '/create',  to: 'employees#new'
  get '/edit',    to: 'employees#edit'
  get '/edit',    to: 'projects#create'
  
  post '/login',  to: 'sessions#create'
  post '/create', to: 'employees#create'
  post '/edit',   to: 'employees#update'
  post '/edit',   to: 'projects#create'
    
  resources :users
  resources :employees  
  resources :projects
  resources :assignments
end
