class Season < ApplicationRecord
  # model association
  has_many :episodes, dependent: :destroy
  
  # validations
  validates_presence_of :title, :plot
end
