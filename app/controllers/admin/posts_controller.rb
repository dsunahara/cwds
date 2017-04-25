module Admin

  class PostsController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
    #before_action :admin_user, only: [:show, :edit, :update, :destroy, :index]
    before_action :check_role, only: [:show, :edit, :update, :destroy, :index]
    
    def index
      @posts = Post.all
    end
    
    def new
      @post = Post.new
    end
    
    private
      #check and make sure it user is site admin before giving access 
        def check_role
          redirect_to(root_url) unless check_role?("News Editor") or check_role?("Site Admin")
        end
      
        #confirms a logged-in user.
        def logged_in_user
          unless logged_in?
            store_location
            flash[:danger]= "Please log in."
            redirect_to login_path
            
        end
    
  
    
    
  end #end of class
end #end of module