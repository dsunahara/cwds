module Admin

  class PostsController < ApplicationController
    
    def index
      @posts = Post.all
    end
    
    
  end #end of class
end #end of module