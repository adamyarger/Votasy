require 'rails_helper'

describe User do
	it { should have_many(:posts) }
	it { should have_many(:comments) }
	it { should have_many(:links) }

	it { should validate_presence_of(:name) }

	# paperclip matchers
	it { should validate_attachment_content_type(:avatar).
								allowing('image/png', 'image/gif').
								rejecting('text/plain', 'text/xml') }
	it { should validate_attachment_size(:avatar).
							less_than(2.megabytes) }
end