class PostsController < ApplicationController
  
  def index
    #show the title of the Filtered blog
    @categories = Category.distinct.pluck(:name)
    
    if params[:tag]
     @posts = Post.tagged_with(params[:tag]).order('created_at DESC')
     @title = params[:tag].titleize
    elsif params[:category]
      @posts = Post.categorized_with(params[:category]).order('created_at DESC')
      @title = params[:category].titleize
    else
     @posts = Post.all.where(:status => 'Published').order('created_at DESC')
    end
  end
  
  def new
    @post = Post.new
  end
  
  def create 
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
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
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to posts_path
  end
  
  
  def show
    @post =  Post.find(params[:id])
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body, :all_tags, :all_categories, :status)
    
  end
  

end
