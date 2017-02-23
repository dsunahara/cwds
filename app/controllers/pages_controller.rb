class PagesController < ApplicationController
  
  def show
    
   # @page = Page.find(params[:id])
   @page = Page.find_by_id(params[:id])
   redirect_to not_found_path unless @page
    CwdsApp::Application.routes_reloader.reload!
    
  end
  
end
