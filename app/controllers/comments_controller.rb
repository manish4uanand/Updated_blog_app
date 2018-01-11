class CommentsController < ApplicationController
	before_action :set_post

	def new
		@comment = @post.comments.build
	end

	def create
		@comment = @post.comments.create(comment_params)
		if @comment.save
			flash[:error] = "Saved Successfully!"
		else
			flash[:error] = "Can't save, please fill all the details."
		end
		redirect_to post_path(@post)
	end

	def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end
	
	private
		def set_post
	    @post = Post.find(params[:post_id])
	  end

	  def comment_params 
      params.require(:comment).permit(:name, :body)
    end

end
