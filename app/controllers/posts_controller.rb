class PostsController < ApplicationController
     before_action :logged_in_user, only: [:edit, :update, :destroy]
    #before_action :admin_user, only: [:show, :edit, :update, :destroy, :index]
    before_action :check_role, only: [:edit, :update, :destroy]
  
  def index
    #show the title of the Filtered blog
    @categories = Category.distinct.pluck(:name)
    
    if params[:tag]
     @posts = Post.tagged_with(params[:tag]).order('publish_time DESC')
     @title = params[:tag].titleize
    elsif params[:category]
      @posts = Post.categorized_with(params[:category]).order('publish_time DESC')
      @title = params[:category].titleize
    else
     @posts = Post.published.order('publish_time DESC')
       respond_to do |format|
        format.html
        format.rss { render :layout => false }
      end
    end
  end
  
  def new
    @post = Post.new
  end
  
  def create 
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_posts_url
    else
      render 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to admin_posts_url
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to admin_posts_url
  end
  
  
  def show
    @post =  Post.find(params[:id])
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body, :all_tags, :all_categories, :status, :publish_time)
  end
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
      end
  

end
