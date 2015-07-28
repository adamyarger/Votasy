class Comment < ActiveRecord::Base
	belongs_to :user
	belongs to :commentable, polymorphic: true
	validates :body, presence: true
end
