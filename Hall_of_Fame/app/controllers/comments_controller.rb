class CommentsController<ApplicationController
	before_filter :authenticate, :only => [:create, :destroy, :edit]

	def create
		@comment = current_user.comments.build(params[:comment])
		if @comment.save
			flash[:success] = "Comments saved"
			redirect_to action: "posts/show", :id => @comment.post_id
		else
			flash[:failure] = "Échec"
			redirect_to action: "posts/show", :id => @comment.post_id
		end
	end

	def feed
		@comment=Comment.where("post_id = ?",id)
	end

	def destroy
		self.destroy()
	end

	def edit
		
	end
end


