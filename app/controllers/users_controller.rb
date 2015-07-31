class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
		@links = @user.links
		@array = (@posts.to_a + @links.to_a).sort_by(&:created_at).paginate(:page => params[:page], :per_page => 20)
	end

	def following
		@title = 'Following'
		@user = User.find(params[:id])
		@users = @user.following.paginate(:page => params[:page], :per_page => 20)
		render 'show_follow'
	end

	def followers
		@title = 'Followed by'
		@user = User.find(params[:id])
		@users = @user.followers.paginate(:page => params[:page], :per_page => 20)
		render 'show_follow'
	end
end
