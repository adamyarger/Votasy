class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  validates :content, presence: true
  validates :link, presence: true
  acts_as_votable
  acts_as_taggable
  default_scope -> { order(created_at: :desc) }

	after_create :update_from_embedly

	def update_from_embedly
    link_object = self
    urls = [link]

    embedly_api = Embedly::API.new(:key => "4e4f48f422454147b45661749719a0d3")
    embedly_objs = embedly_api.oembed(:urls => urls, :maxwidth => 500, :width => 500, :autoplay => false)
    embedly_obj = embedly_objs[0]
    response_data = embedly_obj.marshal_dump
    
    link_object.title             =  response_data[:title]
    link_object.author_url        =  response_data[:author_url]
    link_object.provider_name     =  response_data[:provider_name]
    link_object.html              =  response_data[:html]
    link_object.thumbnail_url		  =	 response_data[:thumbnail_url]
    link_object.thumbnail_width   =  response_data[:thumbnail_width]
    link_object.thumbnail_height  =  response_data[:thumbnail_height]
    link_object.save
  end
end
