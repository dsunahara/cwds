Rails.application.routes.draw do
  
  root 'static_pages#home'
   
  

  get  '/news', to: 'static_pages#news'

  
  
end
