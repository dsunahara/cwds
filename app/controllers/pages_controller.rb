class PagesController < ApplicationController
  
  def show
    
   # @page = Page.find(params[:id])
   puts "testing"
   puts params[:id]
   #@page = Page.find_by_id(params[:id])
   @page = Page.find_by_slug(params[:id])
   redirect_to not_found_path unless @page

    
  end
  
end
