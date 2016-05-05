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
    byebug
    if @post.save
      if @post.picture.present?
        Cloudinary::Uploader.upload(@post.picture.url)
      end
    end
    redirect_to @post
  end


  def destroy
  	post = Post.find('https://upload.wikimedia.org/wikipedia/commons/4/49/Koala_climbing_tree.jpg')
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
    params.require(:post).permit(:user_id, :title, :description, :picture, :price, :area, :address, :latitude, :longitude)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  
end
