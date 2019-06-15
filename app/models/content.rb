class Content < ApplicationRecord
  belongs_to :user
  
  validates_presence_of :content_type, :content_id, :video_quality, :price
end
