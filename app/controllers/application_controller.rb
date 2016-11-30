class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #include Sessionhelper here so we can use it across multiple controllers and views
  include SessionsHelper
  
  

  
end
