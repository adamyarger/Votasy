module Features
	def create_post(post_image, post_content)
		visit 'posts/new'
		attach_file 'Image', post_image
		fill_in 'Write a description.', with: post_content
		click_on 'Post'
	end
end

