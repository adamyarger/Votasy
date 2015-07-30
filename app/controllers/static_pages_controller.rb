class StaticPagesController < ApplicationController
	def feed
		if user_signed_in?
			@posts = current_user.feed_posts.order(created_at: :desc)
			@links = current_user.feed_links.order(created_at: :desc)
			@array = (@posts.to_a + @links.to_a).sort_by(&:created_at).paginate(:page => params[:page], :per_page => 10)
		else
			@posts = Post.all
			@links = Link.all
			@array = (@posts.to_a + @links.to_a).sort_by(&:created_at).paginate(:page => params[:page], :per_page => 10)
		end
	end
end
