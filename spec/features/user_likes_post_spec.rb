require 'rails_helper'

feature 'user likes a post' do
	scenario 'likes post on show page' do
		user = FactoryGirl.create(:user)
		login_as(user, scope: :user)

		create_post('spec/support/photos/blur_holder.jpg', 'first post', 'edm, techno')
		find('.image_link').click

		find('.up').click
		expect(page).to have_css '.down'

		find('.down').click
		expect(page).to have_css '.up'
	end
end

