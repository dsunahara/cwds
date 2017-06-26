module Admin

class RolesController < ApplicationController
  before_action :logged_in_user, only: [:index,:destroy]
  #before_action :admin_user, only: [:show, :destroy, :index]
  before_action :check_role, only: [:show, :destroy, :index, :update, :edit, :new]
  
  
  #select a user that you want to add/destroy role from
  def index
      @users = User.all
  end
  
   # GET /roles/new
    def new
      @role = Role.new
      @user = User.find(params[:user_id]) 
      @roles = Role.joins(:assignments).where(assignments: {user_id: [params[:user_id]]})
    end
    
    def create
      @user = User.find(params[:role][:user_id])
      
      respond_to do |format|
        #Only add the role if it doesn't already exisit
        unless @user.roles.any?{|u| u.name == params[:role_name]}
            @user.roles << Role.new(name: params[:role_name])
            format.html { redirect_to new_admin_role_path(:user_id => @user.id), notice: 'Role was successfully created.' }
            format.json { render :show }
            
            
          else
             format.html { redirect_to new_admin_role_path(:user_id => @user.id), notice: 'Role exist already.' }
             format.json { render :show }
             
        end
      end
      
        
    
        
       
       
      
        
    
      
        # respond_to do |format|
        #   if @user.save
            
        #     format.html { redirect_to admin_roles_url, notice: 'Role was successfully created.' }
        #     format.json { render :show, status: :created, location: @user }
           
        #   else
        #     format.html { render :new }
        #     format.json { render json: @user.errors, status: :unprocessable_entity }
        #   end
        
    #end
  
    end
  
  #show the user's roles here, select the role that you want to destroy or click on add new role
  def show
    #@user = User.find(params[:id])
    @roles = Role.joins(:assignments).where(assignments: {user_id: [params[:id]]})
  end
  
  #edit not needed
  def edit
  end
  
   
  #  DELETE a specific role in roles 
  def destroy
    @role = Role.find(params[:role_id])
    @role.destroy
    respond_to do |format|
      format.html { redirect_to admin_roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    
      private
        #confirms admin user
        def admin_user
          
          redirect_to(root_url) unless current_user.admin?
        end
        
        #check and make sure it user is site admin before giving access 
        def check_role
          redirect_to(root_url) unless check_role?("Site Admin")
        end
        
        
        #confirms a logged-in user.
        def logged_in_user
          unless logged_in?
            store_location
            flash[:danger]= "Please log in."
            redirect_to login_path
          end
        end 
        
      end#end of private 

end
