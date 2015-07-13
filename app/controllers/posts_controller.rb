class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			flash[:success] = 'Successfully Posted!'
			redirect_to root_path
		else
			flash[:error] = 'Something went wrong'
			redirect_to root_path
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	private

		def post_params
			params.require(:post).permit(:image, :content)
		end
end
