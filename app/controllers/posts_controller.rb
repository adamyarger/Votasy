class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :new]

	def index
		@posts = current_user.feed_posts
		@links = current_user.feed_links
		@array = (@posts.to_a + @links.to_a).sort_by(&:created_at).paginate(:page => params[:page], :per_page => 20)
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
