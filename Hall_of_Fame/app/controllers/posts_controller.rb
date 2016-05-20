class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

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

  def top
    @post = Post.order(:cached_weighted_average).paginate(:page => params[:page])
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if current_user
      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    else
      redirect_to @post, notice: "Vous n'êtes pas connecté"
    end
  end


  def random
    @post=Post.order("RANDOM()").paginate(:page => params[:page])

  end


  private

  def post_params
  	params.require(:post).permit(:title,:content,:image,:image_cache, :remove_image)
  end
end
