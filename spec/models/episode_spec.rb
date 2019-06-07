require 'rails_helper'

RSpec.describe Episode, type: :model do
  # Association test
  # ensure an episode record belongs to a single season record
  it { should belong_to(:season) }
  
  # Validation test
  # ensure columns title and plot are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:plot) }
end
