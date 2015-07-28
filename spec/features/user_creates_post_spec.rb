require 'rails_helper'

feature 'user creates a new post' do
	scenario 'successfully' do
		user = FactoryGirl.create(:user)
		login_as(user, scope: :user)

		create_post('spec/support/photos/blur_holder.jpg', 'first post', 'edm, techno')

		expect(page).to have_css('img')
		expect(page).to have_content('first post')
		expect(page).to have_link 'edm'
		expect(page).to have_link 'techno'
	end
end

