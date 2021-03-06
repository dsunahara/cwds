module Admin

  class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
    #before_action :admin_user, only: [:show, :edit, :update, :destroy, :index]
    before_action :check_role, only: [:show, :edit, :update, :destroy, :index]
  
    # GET /pages
    # GET /pages.json
    def index
      @pages = Page.order("title").all
    end
  
    # GET /pages/1
    # GET /pages/1.json
    def show
      
    end
  
    # GET /pages/new
    def new
      @page = Page.new
    end
  
    # GET /pages/1/edit
    def edit
    end
  
    # POST /pages
    # POST /pages.json
    def create
      @page = Page.new(page_params)
  
      respond_to do |format|
        if @page.save
          
          format.html { redirect_to admin_page_path(@page), notice: 'Page was successfully created.' }
          format.json { render :show, status: :created, location: @page }
         
        else
          format.html { render :new }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /pages/1
    # PATCH/PUT /pages/1.json
    def update
      respond_to do |format|
        if @page.update(page_params)
          format.html { redirect_to admin_page_path(@page), notice: 'Page was successfully updated.' }
          format.json { render :show, status: :ok, location: @page }
        else
          format.html { render :edit }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end 
  
    # DELETE /pages/1
    # DELETE /pages/1.json
    def destroy
      @page.destroy
      respond_to do |format|
        format.html { redirect_to admin_pages_url, notice: 'Page was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find_by_slug(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def page_params
        params.require(:page).permit(:title, :body, :slug, :private, :template, :fileFolder, :wikiNav)
      end
      
      #confirms admin user
      def admin_user
        redirect_to(root_url) unless current_user.admin?
      end
      
      #check and make sure it user is site admin before giving access 
        def check_role
          redirect_to(root_url) unless check_role?("Content Editor") or check_role?("Site Admin")
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

end