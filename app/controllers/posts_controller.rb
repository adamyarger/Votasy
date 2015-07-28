class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :new]

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

	def index
		if params[:tag]
			@posts = Post.tagged_with(params[:tag])
			@links = Link.tagged_with(params[:tag])
			@array = (@posts.to_a + @links.to_a).sort_by(&:created_at).paginate(:page => params[:page], :per_page => 10)
		else
			@posts = Post.all
			@links = Link.all
			@array = (@posts.to_a + @links.to_a).sort_by(&:created_at).paginate(:page => params[:page], :per_page => 10)
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
			params.require(:post).permit(:image, :content, :tag_list)
		end
end
