FactoryGirl.define do
  factory :comment do
		user
		body "MyText"
		commentable_id "1"
    commentable_type "Post"
  end
end
