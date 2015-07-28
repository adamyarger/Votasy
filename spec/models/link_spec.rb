require 'rails_helper'

describe Link do
	it { should belong_to(:user) }
	it { should have_many(:comments) }
	it { should validate_presence_of(:content) }
end
