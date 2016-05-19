class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def upvote
    @post = Post.find(params[:id])
    @post.liked_by current_user
    redirect_to @post
  end

  def downvote
    @post = Post.find(params[:id])
    @post.disliked_by current_user
    redirect_to @post
  end

  def index
  	@post=Post.paginate(:page => params[:page])
  end

  def show
  	@post=Post.find(params[:id])
    if signed_in?
      @new_comment = Comment.build_from(@post, current_user.id, "")
    end
  end

  def new
  	@post=Post.new
  end
  def create

    if current_user
      @user = current_user
      @post = @user.posts.build(post_params)
      if @post.save
        redirect_to posts_path, notice: 'Post saved successfully!'
      else
        redirect_to posts_path, notice: 'oops! Some error occurred!'
      end
    else
      redirect_to new_user_session_path, notice: "Vous n'êtes pas connecté."
    end
  end

  def random
    @post=Post.limit(30).order("RANDOM()")
  end


  private

  def post_params
  	params.require(:post).permit(:title,:content,:image)
  end
end
