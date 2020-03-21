Rails.application.routes.draw do
  get 'users/new'
  get '/login', to: 'static_pages#login'
  root 'static_pages#home'
end
