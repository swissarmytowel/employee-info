Rails.application.routes.draw do
  get '/login', to: 'static_pages#login'
  root 'static_pages#home'
end
