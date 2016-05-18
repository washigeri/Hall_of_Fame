class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def upvote
    @post = Post.find(params[:id])
    @post.vote_by current_user
    redirect_to @post
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_from current_user
    redirect_to @post
  end

  def index
  	@post=Post.paginate(:page => params[:page])
  end

  def show
  	@post=Post.find(params[:id])
  end

  def new
  	@post=Post.new
  end
  def create

    if current_user
      @user = current_user
      @post = @user.posts.build(post_params)
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
