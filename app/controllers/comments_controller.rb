class CommentsController < ApplicationController
	before_action :set_resource, only: [:create, :destroy]
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		# @user = User.find(params[:user_id])
		# @comment = case action_name
		#   when 'create' then @post.comments.create(comment_params)
		# end
		# raise 'error' unless @comment.cando?(action_name, current_user)
		@comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post)
    end
	end
	def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
	end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @comment = case action_name
    when 'create' then Comment.create
    when 'destroy' then comment = Comment.find(params[:id])
    end
    raise 'error' unless @comment.cando?(action_name, current_user, comment)
  end
	private
		def comment_params
			params.require(:comment).permit(:author, :content)
		end
end
