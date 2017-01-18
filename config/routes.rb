Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'

  get  '/news', to: 'static_pages#news'
  get  '/signup', to: 'users#new'
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get  '/join_cwds', to: 'static_pages#join_cwds'

  
  
  resources :users
  
  
end
