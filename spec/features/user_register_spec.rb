require 'rails_helper'

# come bak later to test deifferent cenarios of register

feature 'user registers an account' do
	scenario 'successfully' do
		visit '/users/sign_up'

		fill_in 'Email',									:with => 'person@example.com'
		fill_in 'Password', 							:with => 'password'
		fill_in 'Password confirmation',	:with => 'password'

		click_button 'Sign up'

		expect(page).to have_content('Welcome! You have signed up successfully.')
	end
end