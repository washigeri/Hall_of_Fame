class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  	@post=Post.all
  end

  def show
  	@post=Post.find(params[:id])
  end

  def new
  	@post=Post.new
  end
  def create
  	@post=Post.new(post_params)
    @post.user=current_user
  	@post.save
  	redirect_to @post
  end
  def post_params
  	params.require(:post).permit(:title, :content, :image, :image_cache)
  end
end
