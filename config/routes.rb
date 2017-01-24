Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'

  get  '/signup', to: 'users#new'
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get  '/news', to: 'static_pages#news'
  get  '/how_we_operate', to: 'static_pages#how_we_operate'
  get  '/dashboard', to: 'static_pages#dashboard'
  get  '/stakeholders', to: 'static_pages#stakeholders'
  get  '/vendors', to: 'static_pages#vendors'
  get  '/join_cwds', to: 'static_pages#join_cwds'


  
  
 resources :users
 resources :account_activations, only: [:edit]
  
end
