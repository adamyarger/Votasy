class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :links
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # paperclip profile
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 2.megabytes
  has_attached_file :avatar, :styles => { :medium => "250x250#", :thumb => "100x100#" }, 
                                                    :default_url => ":style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true
end
