class User < ActiveRecord::Base
  acts_as_voter
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :links
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # paperclip profile
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 2.megabytes
  has_attached_file :avatar, :styles => { :medium => "250x250#", :thumb => "100x100#" }, 
                                                    :default_url => ":style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :name, presence: true

  after_save :load_into_soulmate
  before_destroy :remove_from_soulmate

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def feed_posts
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  def feed_links
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Link.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  private

    def load_into_soulmate
      loader = Soulmate::Loader.new("users")
      loader.add("term" => name, "id" => self.id, "data" => {
        "link" => Rails.application.routes.url_helpers.user_path(self)
        })
    end
   
    def remove_from_soulmate
      loader = Soulmate::Loader.new("recipes")
        loader.remove("id" => self.id)
    end
end









