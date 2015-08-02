class PostsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			flash[:success] = 'Successfully Posted!'
			redirect_to @post
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

	def upvote
		@post = Post.find(params[:id])

		if @post.save
			@post.upvote_by current_user
			flash[:success] = "Upvoted"
		else
			flash[:error] = "Please Sign In"
		end
		redirect_to :back
	end

	def downvote
		@post = Post.find(params[:id])

		if @post.save
			@post.downvote_by current_user
			flash[:success] = "Downvoted"
		else
			flash[:error] = "Please Sign In"
		end
		redirect_to :back
	end

	private

		def post_params
			params.require(:post).permit(:image, :content, :tag_list)
		end
end
