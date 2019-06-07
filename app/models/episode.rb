class Episode < ApplicationRecord
  # model association
  belongs_to :season
  
  # validation
  validates_presence_of :title, :plot
end
