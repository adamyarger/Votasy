class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@posts = @user.posts
		@links = Link.all
		@array = (@posts.to_a + @links.to_a).sort_by(&:created_at).paginate(:page => params[:page], :per_page => 20)
	end
end
