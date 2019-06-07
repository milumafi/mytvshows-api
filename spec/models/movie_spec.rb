require 'rails_helper'

RSpec.describe Movie, type: :model do
  # Validation Tests
  # ensure columns title and plot are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:plot) }
end
