require 'rails_helper'

describe Comment do
	it { should belong_to(:user) }
	it { should belong_to(:post) }
	it { should validate_presence_of(:body) }
end
