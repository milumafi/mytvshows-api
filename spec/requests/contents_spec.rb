require 'rails_helper'

RSpec.describe 'Content API', type: :request do
  # initialize test data
  let!(:seasons) { create_list(:season, 10) }
  let!(:movies) { create_list(:movie, 10) }
  let(:movie_id) { movies.first.id }
  let(:season_id) { seasons.first.id }
  
  # Test suite for GET /seasons
  describe 'GET /contents' do
    # make HTTP get request before each test
    before { get '/contents' }
    
    it 'returns contents' do
      # Note 'json' is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
