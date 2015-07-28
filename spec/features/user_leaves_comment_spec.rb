require 'rails_helper'

feature 'user leaves a comment' do
	scenario 'successfully' do
		user = FactoryGirl.create(:user)
		login_as(user, scope: :user)

		create_post('spec/support/photos/blur_holder.jpg', 'first post')
		find('.image_link').click

		fill_in 'Comment', :with => 'first comment'
		click_on('Comment')

		expect(page).to have_content 'first post'
	end
end