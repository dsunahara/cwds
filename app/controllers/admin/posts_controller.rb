module Admin

  class PostsController < ApplicationController
    
    def index
      @posts = Post.all
    end
    
    def new
      @post = Post.new
    end
  
    
    
  end #end of class
end #end of module