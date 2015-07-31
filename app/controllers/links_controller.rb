class LinksController < ApplicationController
	before_action :authenticate_user!
	def create
		@link = current_user.links.build(link_params)

		if @link.save
			flash[:success] = 'Successfully Posted!'
			redirect_to root_path
		else
			flash[:error] = 'Something went wrong'
			render :new
		end
	end

	def new
		@link = Link.new
	end

	def show
		@link = Link.find(params[:id])
	end

	def upvote
		@link = Link.find(params[:id])

		if @link.save
			@link.upvote_by current_user
			flash[:success] = "Upvoted"
		else
			flash[:error] = "Please Sign In"
		end
		redirect_to :back
	end

	def downvote
		@link = Link.find(params[:id])

		if @link.save
			@link.downvote_by current_user
			flash[:success] = "Downvoted"
		else
			flash[:error] = "Please Sign In"
		end
		redirect_to :back
	end

	private

		def link_params
			params.require(:link).permit(:content, :tag_list, :link)
		end
end
