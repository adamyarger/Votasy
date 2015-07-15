class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :new]

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

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
		@comments = Comment.where(post_id: @post)
	end

	private

		def post_params
			params.require(:post).permit(:image, :content)
		end
end
