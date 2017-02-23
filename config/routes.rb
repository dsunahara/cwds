Rails.application.routes.draw do
  
  
  
  
  
  
  mount Ckeditor::Engine => '/ckeditor'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  resources :pages, only: [:show]
  namespace :admin do 
    resources :pages  # admin/pages 
  end
  
  
  

  
  get '/test-12', to: 'pages#show', id: '6'
  
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  

  get  '/signup', to: 'users#new'
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 
  get  '/about_cwds', to: 'static_pages#about_cwds'
  get  '/news', to: 'static_pages#news'
  get  '/how_we_operate', to: 'static_pages#how_we_operate'
  get  '/dashboard', to: 'static_pages#dashboard'
  get  '/stakeholders', to: 'static_pages#stakeholders'
  get  '/vendors', to: 'static_pages#vendors'
  get  '/join_cwds', to: 'static_pages#join_cwds'


  get  '/project_management_plan', to: 'static_pages#project_management_plan'
  get  '/requirements_management_plan', to: 'static_pages#requirements_management_plan'
  get  '/risk_and_issue_plan', to: 'static_pages#risk_and_issue_plan'
  get  '/schedule_management_plan', to: 'static_pages#schedule_management_plan'
  
  get  '/cwds_github_website_standards', to: 'static_pages#cwds_github_website_standards'
  get  '/digital_service_design_standards', to: 'static_pages#digital_service_design_standards'
  get  '/project_management', to: 'static_pages#project_management'
  get  '/plan_template', to: 'static_pages#plan_template'

  get  '/vendors/ADPQ_accepted_vendors', to: 'static_pages#ADPQ_accepted_vendors'
  get  '/vendors/ADPQ_vendor_pool_RFI_announcement', to: 'static_pages#ADPQ_vendor_pool_RFI_announcement'
  get  '/vendors/CALS_contract_execution', to: 'static_pages#CALS_contract_execution'
  get  '/vendors/API_contract_execution', to: 'static_pages#API_contract_execution'
  get  '/vendors/Intake_contract_execution', to: 'static_pages#Intake_contract_execution.html'
  get  '/vendors/Intake_Implementation_bidders_conference', to: 'static_pages#Intake_Implementation_bidders_conference'

  get  '/dashboard/CALS', to: 'static_pages#CALS'
  get  '/dashboard/API', to: 'static_pages#API'
  get  '/dashboard/Intake', to: 'static_pages#Intake'
  
  get  '/stakeholders/FAQ', to: 'static_pages#FAQ'
  get  '/stakeholders/stakeholder_feedback', to: 'static_pages#stakeholder_feedback'
  get  '/stakeholders/sprint_reviews', to: 'static_pages#sprint_reviews'
  get  '/stakeholders/legislative_reports', to: 'static_pages#legislative_reports'
  get  '/stakeholders/monthly_reports', to: 'static_pages#monthly_reports'
  get  '/stakeholders/quarterly_stakeholder_forums', to: 'static_pages#quarterly_stakeholder_forums'
  get  '/stakeholders/quarterly_stakeholder_forums/qsf_materials_20170110', to: 'static_pages#qsf_materials_20170110'
  get  '/stakeholders/quarterly_stakeholder_forums/qsf_agenda_20170110', to: 'static_pages#qsf_agenda_20170110'

    #check and exclude all pages where slug is emptyid: params[:id]
  Page.all.each do |page|
    #get "/#{page.slug}", controller: "pages", action:"show", id:page.id
    #get "/:slug" => "pages#show"
    
    get "/#{page.slug}", to: 'pages#show', id:page.id
  end

 
  
end



