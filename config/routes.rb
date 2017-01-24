Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'

  get  '/news', to: 'static_pages#news'
  get  '/signup', to: 'users#new'
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  
 resources :users
 resources :account_activations, only: [:edit]
  
end
