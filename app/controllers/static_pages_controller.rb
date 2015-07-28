class StaticPagesController < ApplicationController
	def feed
		@posts = current_user.feed_posts
		@links = current_user.feed_links
		@array = (@posts.to_a + @links.to_a).sort_by(&:created_at).paginate(:page => params[:page], :per_page => 20)
	end
end
