require 'rails_helper'

describe User do
	before(:each) do
		@user = FactoryGirl.create(:user)
		@followed = FactoryGirl.create(:user)
	end
	it { should have_many(:posts) }
	it { should have_many(:comments) }
	it { should have_many(:links) }
	it { should have_many(:active_relationships) }
	it { should have_many(:following).through(:active_relationships).source(:followed) }

	it { should validate_presence_of(:name) }

	# paperclip matchers
	it { should validate_attachment_content_type(:avatar).
								allowing('image/png', 'image/gif').
								rejecting('text/plain', 'text/xml') }
	it { should validate_attachment_size(:avatar).
							less_than(2.megabytes) }

	it "should have a following? method" do
    expect(@user).to respond_to(:following?)
  end
  
  it "should have a follow method" do
    expect(@user).to respond_to(:follow)
  end

  it "should have a unfollow method" do
  	expect(@user).to respond_to(:unfollow)
  end

  it "should follow another user" do
    @user.follow(@followed)
    expect(@user).to be_following(@followed)
  end

  it "should unfollow another user" do
  	@user.follow(@followed)
  	@user.unfollow(@followed)
  	expect(@user.following.include?(@followed)).to be_falsey
  end

  it "should include the followed user in the following array" do
    @user.follow(@followed)
    expect(@user.following.include?(@followed)).to be_truthy
  end

end