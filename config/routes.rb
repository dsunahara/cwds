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
  get  '/vendors/ADPQ_accepted_vendors', to: 'static_pages#ADPQ_accepted_vendors'
  get  '/vendors/ADPQ_vendor_pool_RFI_announcement', to: 'static_pages#ADPQ_vendor_pool_RFI_announcement'
  get  '/vendors/CALS_contract_execution', to: 'static_pages#CALS_contract_execution'
  get  '/vendors/API_contract_execution', to: 'static_pages#API_contract_execution'
  get  '/vendors/Intake_contract_execution', to: 'static_pages#Intake_contract_execution.html'
  get  '/vendors/Intake_Implementation_bidders_conference', to: 'static_pages#Intake_Implementation_bidders_conference'
  get  '/dashboard/CALS', to: 'static_pages#CALS'
  get  '/dashboard/API', to: 'static_pages#API'
  get  '/dashboard/Intake', to: 'static_pages#Intake'
  
  resources :users
  
  
end
