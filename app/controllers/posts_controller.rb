class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  	@posts = Post.all
  end

  def show
  end 

  def new
  	@post = Post.new
  end

  def create
    @post = current_user.posts.new(post_attributes)
	  @post.save 
	  redirect_to @post   
  end


  def destroy
  	post = Post.find(params[:id])
  	post.destroy

  	redirect_to posts_path
  end

  def edit
  end

  def update 
    if @post.update(post_attributes)
      redirect_to @post
    end
  end 

private

  def post_attributes
    params.require(:post).permit(:user_id, :title, :description, :price, :area, :address, :latitude, :longitude)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  
end
