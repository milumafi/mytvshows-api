class Movie < ApplicationRecord
  # validations
  validates_presence_of :title, :plot
end
