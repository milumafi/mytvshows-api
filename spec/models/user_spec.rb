require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
    # ensure Todo model has a 1:m relationship with the Item model
    it { should have_many(:contents).dependent(:destroy) }
    # Validation tests
    # ensure column email is present before saving
    it { should validate_presence_of(:email) }
end
