require 'rails_helper'

describe UsersController, type: :controller do
	describe 'GET #show' do
		before(:each) do
			@user = FactoryGirl.create :user
			sign_in @user
		end

		it 'renders the #show view' do
			@user = FactoryGirl.create :user
			get :show, id: @user
			expect(response).to render_template :show
		end
	end
end
