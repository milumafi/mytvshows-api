require 'rails_helper'

RSpec.describe 'Episodes API' do
  # Initialize the test data
  let!(:season){ create(:season) }
  let!(:episodes){ create_list(:episode, 20, season_id: season.id) }
  let(:season_id){ season.id }
  let(:id){ episodes.first.id }
  
  # Test suite for GET /seasons/:season_id/episodes
  describe 'GET /seasons/:season_id/episodes' do
    before { get "/seasons/#{season_id}/episodes" }
    
    context 'when season exist' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      
      it 'returns all season episodes' do
        expect(json.size).to eq(20)
      end
    end
    
    context 'when season does not exist' do
      let(:season_id){ 0 }
      
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Season/)
      end
    end
  end
  
  # Test suite for GET /seasons/:season_id/episodes/:id
  describe 'GET /seasons/:season_id/episodes/:id' do
    before { get "/seasons/#{season_id}/episodes/#{id}" }
    
    context 'when season episode exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      
      it 'returns the episode' do
        expect(json['id']).to eq(id)
      end
    end
    
    context 'when season episode does not exist' do
      let(:id){ 0 }
      
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Episode/)
      end
    end
  end
  
  # Test suite for PUT /seasons/:season_id/episodes
  describe 'POST /seasons/:season_id/episodes' do
    let(:valid_attributes){{ title: 'El Boom', plot: 'XXXXXXXX' }}
    
    context 'when request attributes are valid' do
      before { post "/seasons/#{season_id}/episodes", params: valid_attributes }
      
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    
    context 'when an invalid request' do
      before { post "/seasons/#{season_id}/episodes", params: {} }
      
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      
      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end
  
  # Test suite for PUT /seasons/:season_id/episodes/:id
  describe 'PUT /seasons/:season_id/episodes/:id' do
    let(:valid_attributes) {{ title: 'El Boom' }}
    
    before{ put "/seasons/#{season_id}/episodes/#{id}", params: valid_attributes }
    
    context 'when episode exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
      
      it 'updates the episode' do
        updated_episode = Episode.find(id)
        expect(updated_episode.title).to match(/El Boom/)
      end
    end
    
    context 'when the item does not exist' do
      let(:id){ 0 }
      
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      
      it 'returns a not found message' do 
        expect(response.body).to match(/Couldn't find Episode/)
      end
    end
  end
  
  # Test suite for DELETE /seasons/:season_id/episodes/:id
  describe 'DELETE /seasons/:season_id/episodes/:id' do
    before{ delete "/seasons/#{season_id}/episodes/#{id}" }
    
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end