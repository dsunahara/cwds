class PagesController < ApplicationController
  
  def show
   if private_page?
    logged_in_user
    @page = Page.find_by_slug(params[:id])
    redirect_to root_path unless @page
   end
   
  end
  
  def index
   @page = Page.find_by_slug('home')
  end
  
  def private_page?
   @page = Page.find_by_slug(params[:id])
   if @page.private == true
    return true
   end
  end
  
  #confirms a logged-in user.
      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger]= "Please log in."
          redirect_to login_path
          
        end
      end
  
end
