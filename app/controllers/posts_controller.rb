class PostsController < ApplicationController

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end 

  def new
  	@post = Post.new
  end

  def create
  	@post = current_user.posts.new(allowed_attributes)
	@post.save 
	redirect_to @post   
  end


  def destroy
  	post = Post.find(params[:id])
  	post.destroy

  	redirect_to posts_path
  end

  def update 
  end 

  
end
