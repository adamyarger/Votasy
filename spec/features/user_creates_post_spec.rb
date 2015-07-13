require 'rails_helper'

feature 'user creates a new post' do
	scenario 'successfully' do
		user = FactoryGirl.create(:user)
		login_as(user, scope: :user)

		# create_post('spec/support/photos/blur_holder.jpg', 'first post')
		visit 'posts/new'
		attach_file 'Image', 'spec/support/photos/blur_holder.jpg'
		fill_in 'Write a description.', with: 'first post'
		click_on 'Post'

		expect(page).to have_css('img')
		expect(page).to have_content('first post')
	end
end

