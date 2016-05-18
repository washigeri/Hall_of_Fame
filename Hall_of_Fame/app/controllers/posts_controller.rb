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

    if current_user
      @post=Post.new(params[:movie])

      @post.user_id=current_user.id
  	  @post.save
      if @post.save
        redirect_to posts_path, notice: 'Post saved successfully!'
      else
        redirect_to posts_path, notice: 'oops! Some error occurred!'
      end
    else
      redirect_to new_user_session_path, notice: "Vous n'êtes pas connecté."
    end
  end
  def post_params
  	params.require(:post).permit(:title, :content, :image, :image_cache)
  end
end
