require 'rails_helper'

describe Post do
	it { should belong_to(:user) }
	it { should validate_presence_of(:user_id) }

	# paperclip matchers
	it { should validate_attachment_content_type(:image).
								allowing('image/png', 'image/gif').
								rejecting('text/plain', 'text/xml') }
	it { should validate_attachment_size(:image).
							less_than(2.megabytes) }
end


