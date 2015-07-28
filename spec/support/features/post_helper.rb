module Features
	def create_post(post_image, post_content, tags)
		visit 'posts/new'
		attach_file 'post[image]', post_image
		fill_in 'Write a description.', with: post_content
		fill_in 'Tags (seperate by commas).', with: post_content
		click_on 'Post'
	end

	def create_link(link_url, link_description, tags)
		visit 'links/new'
		fill_in 'Submit a link', with: link_url
		fill_in 'Description', with: link_description
		fill_in 'Tags (seperate by commas)', with: tags
		click_on 'Submit Link'
	end
end

