require 'rails_helper'

RSpec.describe Content, type: :model do
  # Association test
    # ensure an item record belongs to a single todo record
    it { should belong_to(:user) }
    # Validation test
    # ensure columns content_type, content_id, video_quality, price are present before saving
    it { should validate_presence_of(:content_type) }
    it { should validate_presence_of(:content_id) }
    it { should validate_presence_of(:video_quality) }
    it { should validate_presence_of(:price) }
end
