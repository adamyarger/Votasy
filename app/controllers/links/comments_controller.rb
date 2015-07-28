class Links::CommentsController < CommentsController
	before_action :set_commentable

	private

		def set_commentable
			@commentable = Link.find(params[:link_id])
		end
end