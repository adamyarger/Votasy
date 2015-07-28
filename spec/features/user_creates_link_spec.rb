require 'rails_helper'

feature 'user creates a new link' do
	scenario 'successfully' do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)

		create_link('https://www.youtube.com/watch?v=UsvgYXtQB48', 'cool link', 'edm, techno')

		expect(page).to have_content 'Successfully Posted!'
	end
end