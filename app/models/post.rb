class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, as: :commentable
	validates :user_id, :image, presence: true
	acts_as_taggable

	default_scope -> { order(created_at: :desc) }

	validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 2.megabytes
	has_attached_file :image, :styles => { :medium => "1000x1000>", :thumb => "100x100>" }, 
																				:default_url => "/images/blur_holder.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
