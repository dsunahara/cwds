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

  get  '/project_management_plan', to: 'static_pages/management_plans#project_management_plan'
  get  '/requirements_management_plan', to: 'static_pages/management_plans#requirements_management_plan'
  get  '/risk_and_issue_plan', to: 'static_pages/management_plans#risk_and_issue_plan'
  get  '/schedule_management_plan', to: 'static_pages/management_plans#schedule_management_plan'
  
  get  '/cwds_github_website_standards', to: 'static_pages#cwds_github_website_standards'
  get  '/digital_service_design_standards', to: 'static_pages#digital_service_design_standards'
  get  '/project_management', to: 'static_pages#project_management'
  get  '/plan_template', to: 'static_pages#plan_template'
  
  
  
  
  
  
 resources :users
 resources :account_activations, only: [:edit]
  
end
