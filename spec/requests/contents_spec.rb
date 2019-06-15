require 'rails_helper'

RSpec.describe 'Content API', type: :request do
  # initialize test data
  # let!(:seasons) { create_list(:season, 10) }
  # let!(:movies) { create_list(:movie, 10) }
  # let(:movie_id) { movies.first.id }
  # let(:season_id) { seasons.first.id }
  let!(:user){ create(:user) }
  let!(:contents){ create_list(:content, 20, user_id: user.id) }
  let(:user_id){ user.id }
  let(:id){ contents.first.id }
  
  # Test suite for GET /contents
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
  
  
  # Test suite for GET /users/:user_id/contents
  describe 'GET /users/:user_id/contents' do
    before { get "/users/#{user_id}/contents" }
    
    context 'when user exist' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      
      it 'returns all user contents' do
        expect(json.size).to eq(20)
      end
    end
    
    context 'when user does not exist' do
      let(:user_id){ 0 }
      
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end
   
  # Test suite for POST /users/:user_id/contents
  describe 'POST /users/:user_id/contents' do
    let(:valid_attributes){{ title: 'El Veredicto', video_quality: 'HD', price: '2.99' }}
    
    context 'when request attributes are valid but do not match database' do
      before { post "/users/#{user_id}/contents", params: valid_attributes }
      
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
    
    context 'when an invalid request' do
      before { post "/users/#{user_id}/contents", params: {} }
      
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
