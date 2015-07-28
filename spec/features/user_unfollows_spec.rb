require 'rails_helper'

feature 'user unfollows another user' do
	scenario 'successfully' do
		user = FactoryGirl.create(:user)
		user_2 = FactoryGirl.create(:user)
		login_as(user, scope: :user)

		visit user_path(user_2)
		click_button('Follow')
		expect(page).to have_button('Unfollow')

		click_button('Unfollow')
		expect(page).to have_button('Follow')
	end
end

