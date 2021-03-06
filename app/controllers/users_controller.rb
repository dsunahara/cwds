class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  
  def index
     #Show All Users and page them
     #@users = User.paginate(page: params[:page])
     
     #Show only user that is email activated
     @users = User.where(activated: true).paginate(page: params[:page])
  end
  
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated == true
  end
  
  def create
    @user = User.new(user_params)  
    @user.validate_email = true
    if @user.save
      # Handle a successful save.
      #log_in @user
      #flash[:success] = "Thank you for registering!"
      #redirect_to user_url(@user)  #short hand writing is redirect_to @user
      
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @roles = Role.joins(:assignments).where('assignments.user_id = ?', @user.id)
  end
  
  def update
    if @user.update_attributes(user_params)
      #handle success
      flash[:success] = "Profile updated"
      redirect_to @user 
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  #confirms Super admin user
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
  #confirm if user is a regular admin user (site admin has less access than Super Admin)
  def site_admin
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
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  
end
