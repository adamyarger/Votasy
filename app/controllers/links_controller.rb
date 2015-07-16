class LinksController < ApplicationController
	before_action :authenticate_user!
	def create
		@link = current_user.links.build(link_params)

		if @link.save
			flash[:success] = 'Successfully Posted!'
			redirect_to root_path
		else
			flash[:error] = 'Something went wrong'
			redirect_to root_path
		end
	end

	def new
		@link = Link.new
	end

	def show
		@link = Link.find(params[:id])
	end

	private

		def link_params
			params.require(:link).permit(:content)
		end
end
