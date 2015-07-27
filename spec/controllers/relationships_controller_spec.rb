require 'rails_helper'

describe RelationshipsController, type: :controller do
	describe 'POST #create' do
		
		context 'with valid attributes' do
			before(:each) do
				@user = FactoryGirl.create :user
				@followed = FactoryGirl.create :user
				sign_in @user
			end

			it 'creates the relationship' do
				post :create, { followed_id: @followed.id, follower_id: @user.id }
				expect(Relationship.count).to eq(1)
			end
		end

	end
end
