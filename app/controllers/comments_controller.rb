class CommentsController < ApplicationController
	#before_action :set_comment, only: [:show, :create]
	def create
		@post = Post.find(params[:post_id])
		#@user = User.find(params[:user_id])
		@comment = case action_name
		when 'create' then @post.comments.create(comment_params)
		end
		raise 'error' unless @comment.cando?(action_name, current_user)
		@comment.user_id = current_user.id
      if @comment.save
      end
		redirect_to post_path(@post)
	end

	private
		def comment_params
			params.require(:comment).permit(:author, :content)
		end
end
