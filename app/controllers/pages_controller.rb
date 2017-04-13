class PagesController < ApplicationController
  
  def show
   @page = Page.find_by_slug(params[:id])
    redirect_to root_path unless @page
  end
  
  def index
   @page = Page.find_by_slug('home')
  end
  
end
