require 'rails_helper'

RSpec.describe Season, type: :model do
  # Association test
  # ensure Season model has 1:n relationship with Episode model
  it { should have_many(:episodes).dependent(:destroy) }
  
  # Validation tests
  # ensure colimns title and plot are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:plot) }
end
