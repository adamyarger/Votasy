class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@comment = @commentable.comments.new(comment_params)
		@comment.user = current_user
		@comment.save
		redirect_to :back, notice: 'Comment Posted!'
	end

	private

		def comment_params
			params.require(:comment).permit(:body)
		end
end
