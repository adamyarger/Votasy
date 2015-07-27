require 'rails_helper'

describe Relationship do
	before(:each) do
		@follower = FactoryGirl.create(:user)
		@followed = FactoryGirl.create(:user)

		@relationship = Relationship.new(follower_id: @follower.id, followed_id: @followed.id)
	end

	it { should validate_presence_of(:follower_id) }
	it { should validate_presence_of(:followed_id) }

	it 'should create a new instance given vaild attributes' do
		@relationship.save!
	end
end
