class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :show, :index, :edit, :update, :destroy]
  before_action :check_role, only: [:new, :edit, :update, :destroy, :index]
  before_action :check_params, only: [:create]
  
 
  # GET /uploads
  def index
    @uploads = Upload.all
  end
 
  # GET /uploads/1
  def show
    @upload = Upload.find(params[:id])
    #redirect_to @upload.name.file.authenticated_url
  end
 
  # GET /uploads/new
  def new
    @upload = Upload.new
    @uploads = Upload.all
    
    u = Upload.all
    @upload_paths = u.map { 
      |upload| encoded_url = URI.encode(upload.name.path) 
      url = URI(encoded_url).path.split('/').fourth
      URI(encoded_url).path.split('/')[4..-1].each do |i|
        if i != URI(encoded_url).path.split('/').last 
          if has_number?(i) == false
          end
        end
      end
      URI(url)
    }.uniq
  end
 
  # GET /uploads/1/edit
  def edit
  end
 
  # POST /uploads
  def create
    
    #change parama to new directory if it is not empty
    check_params
    if params[:new_directory].blank? == false 
    params[:upload][:directory] = params[:new_directory]
    end
    
    @upload = Upload.new(post_upload_params)
    if @upload.save
      redirect_to uploads_url, notice: 'Upload was successfully created.'
    else
      render :new
    end
  end
 
  # PATCH/PUT /uploads/1
  def update
    if @upload.update(post_upload_params)
      redirect_to uploads_url, notice: 'Upload attachment was successfully updated.'
      
    else
      render :edit
    end
  end
 
  # DELETE /uploads/1
  def destroy
    @upload.destroy
    redirect_to :back, notice: 'File was successfully destroyed.'
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_upload_params
        params.require(:upload).permit(:name, :directory)
    end
      
      
    
    #check and make sure it user is site admin before giving access 
    def check_role
      redirect_to(root_url) unless check_role?("Document Editor") or check_role?("Site Admin")
    end
    
    
    
      
    #confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger]= "Please log in."
        redirect_to login_path
        
      end
    end
    
    def check_params
      if params[:upload][:name] == nil
        flash[:danger] = "Please make sure a file is selected"
        
        redirect_to :controller => "uploads", :action =>"new"
      end
    end
    
    #check if a string only contains number, if yes return true or else false
    def has_number?(i)
      if /^(?<num>\d+)$/ =~ i
        true
      else
        false
      end
    end
    
   
end