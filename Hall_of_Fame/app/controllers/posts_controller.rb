class PostsController < ApplicationController
  def index
  	@post=Post.all
  end

  def show
  	@post=Post.find(params[:id])
    @comments = @post.comments.paginate(:page => params[:page])
    @titre = @post.nom
  end

  def new
  	@post=Post.new
  end

  def create
  	@post=Post.new(post_params)
  	@post.save
  	redirect_to action: "show", :id => @post.id
  end

  def random
    @posts=Post.paginate(:page => post_params[:page])
  end

  private

  def post_params
  	params.require(:post).permit(:title,:content,:image)
  end
end
