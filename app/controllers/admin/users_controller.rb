module Admin

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :check_role, only: [:show, :edit, :update, :destroy, :index]
  
  def index
     #Show All Users and page them
     #@users = User.paginate(page: params[:page])
     
     #Show only user that is email activated
     @users = User.where(activated: true).paginate(page: params[:page])
  end
  
  
  def new
    @user = User.new
    @user.validate_email= false
  end
  
  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated == true
  end
  
  def create
    @user = User.new(user_params)     
    @user.validate_email = false
    if @user.save
      # Handle a successful save.
      #log_in @user
      #flash[:success] = "Thank you for registering!"
      #redirect_to user_url(@user)  #short hand writing is redirect_to @user
      
      @user.send_activation_email
      flash[:info] = "User is activated, they will get an email asking to verify their account"
      redirect_to admin_user_path
    else
      render 'new'
    end
  end

  
  private
  
    def user_params
      params.require(:user).permit(:name, :last_name, :email,:password,:password_confirmation, roles_attributes:[:name])
    end
    
    #Before filters
    
    #confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger]= "Please log in."
        redirect_to login_path
        
      end
    end
    
    #check and make sure it user is site admin before giving access 
    def check_role
      redirect_to(root_url) unless  check_role?("Site Admin")
    end
  
end

end
