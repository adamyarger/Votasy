include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do
    user_id 1
		content "MyString"
		image { fixture_file_upload(Rails.root.join('spec', 'support', 'photos', 'blur_holder.jpg'), 'image/jpg') }
  end
end
