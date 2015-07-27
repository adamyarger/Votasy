class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :links
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # paperclip profile
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 2.megabytes
  has_attached_file :avatar, :styles => { :medium => "250x250#", :thumb => "100x100#" }, 
                                                    :default_url => ":style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
