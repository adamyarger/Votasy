require 'rails_helper'

feature 'user creates a new post' do
	scenario 'successfully' do
		user = FactoryGirl.create(:user)
		login_as(user, scope: :user)

		create_post('first post', )
	end
end

#need to test with an if else statement when adding embedly