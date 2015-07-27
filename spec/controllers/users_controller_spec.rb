require 'rails_helper'

describe UsersController, type: :controller do
	describe 'GET #show' do
		before(:each) do
			@user = FactoryGirl.create :user
			sign_in @user
		end

		it 'renders the #show view' do
			# @user = FactoryGirl.create :user
			get :show, id: @user
			expect(response).to render_template :show
		end
	end

	describe 'GET #following' do
		before(:each) do
			@user = FactoryGirl.create :user
			sign_in @user
		end

		it 'renders the #following view' do
			get :following, id: @user
			expect(response).to render_template :show_follow
		end
	end

	describe 'GET #followers' do
		before(:each) do
			@user = FactoryGirl.create :user
			sign_in @user
		end

		it 'renders the #followers view' do
			get :followers, id: @user
			expect(response).to render_template :show_follow
		end
	end
end
