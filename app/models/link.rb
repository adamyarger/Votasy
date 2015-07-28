class Link < ActiveRecord::Base
	belongs_to :user
  has_many :comments, as: :commentable
	validates :content, presence: true

	after_create :update_from_embedly

	def update_from_embedly
    link = self
    urls = [content]

    embedly_api = Embedly::API.new(:key => "4e4f48f422454147b45661749719a0d3")
    embedly_objs = embedly_api.oembed(:urls => urls, :maxwidth => 500, :width => 500, :autoplay => false)
    embedly_obj = embedly_objs[0]
    response_data = embedly_obj.marshal_dump
    
    link.title             =  response_data[:title]
    link.author_url        =  response_data[:author_url]
    link.provider_name     =  response_data[:provider_name]
    link.html              =  response_data[:html]
    link.thumbnail_url		 =	response_data[:thumbnail_url]
    link.thumbnail_width   =  response_data[:thumbnail_width]
    link.thumbnail_height  =  response_data[:thumbnail_height]
    link.save
  end
end
