Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/login', to: 'static_pages#login'
  root 'static_pages#home'
end
