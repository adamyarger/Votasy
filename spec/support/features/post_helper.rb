module Features
	def create_post(post_image, post_content)
		visit 'posts/new'
		attach_file 'post[image]', post_image
		fill_in 'Write a description.', with: post_content
		click_on 'Post'
	end

	def create_link(link_url)
		visit 'links/new'
		fill_in 'Submit a link', with: link_url
		click_on 'Submit Link'
	end
end

