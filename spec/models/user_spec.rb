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
	it { should have_many(:passive_relationships) }
	it { should have_many(:followers).through(:passive_relationships).source(:follower) }

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

  it "should have a posts feed" do
    expect(@user).to respond_to(:feed_posts)
  end

  it "should have a links feed" do
    expect(@user).to respond_to(:feed_links)
  end

  # it "should include the followed users feed posts" do
  #   @user_1 = FactoryGirl.create(:user)
  #   @user_2 = FactoryGirl.create(:user)
  #   @user_3 = FactoryGirl.create(:user)
  #   @post_following = build(:post, user_id: @user_2.id)
  #   @user_1.follow(@user_2)

  #     expect(@user_1.feed_posts.include(@post_following)).to be_truthy
  #     expect(@user_1.feed.include(post_self)).to be_truthy
  #     expect(@user_1.feed.include(post_unfollowed)).to be_falsey
  # end

end








