Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  
  resources :uploads
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :pages, only: [:show]
  namespace :admin do 
    resources :pages
    resources :roles, only: [:new, :create, :destroy, :index, :show]# admin/roles
    resources :posts
    resources :users, only: [:new, :create, :destroy, :index, :show]
  end
  resources :posts  
  
  get 'tags/:tag', to: 'posts#index', as: "tag"
  get 'categories/:category', to: 'posts#index', as: "category"
  
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'
  

  root 'pages#index'
  
  get  '/signup', to: 'users#new'
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

   
  resources :pages, path: ''

 
  
end



