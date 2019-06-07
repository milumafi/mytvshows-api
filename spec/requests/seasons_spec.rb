require 'rails_helper'

RSpec.describe 'MyTVShows API', type: :request do
  # initialize test data
  let!(:seasons) { create_list(:season, 10) }
  let(:season_id) { seasons.first.id }
  
  # Test suite for GET /seasons
  describe 'GET /seasons' do
    # make HTTP get request before each test
    before { get '/seasons' }
    
    it 'returns seasons' do
      # Note 'json' is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  
  # Test suite for GET /seasons/:id
  describe 'GET /seasons/:id' do
    before { get "/seasons/#{season_id}" }
    
    context 'when the record exists' do
      it 'returns the season' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(season_id)
      end
      
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    
    context 'when the record does not exist' do
      let(:season_id){ 100 }
      
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Season/)
      end
    end
  end
  
  # Test suite for POST /seasons
  describe 'POST /seasons' do
    # valid payload
    let(:valid_attributes){{title: 'Suits', plot: 'XXXXXXX'}}
    
    context 'when the request is valid' do
      before { post '/seasons', params: valid_attributes }
      
      it 'creates a season' do
        expect(json['title']).to eq('Suits')
      end
      
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    
    context 'when the request is invalid' do
      before { post '/seasons', params: {title: 'Sucesor designado'}}
      
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      
      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/Validation failed: Plot can't be blank/)
      end
    end
  end
  
  # Test suite for PUT /seasons/:id
  describe 'PUT /seasons/:id' do
    let(:valid_attributes) {{ title: 'Suits'}}
    
    context 'when the record exists' do
      before { put "/seasons/#{season_id}", params: valid_attributes }
      
      it 'update the record' do
        expect(response.body).to be_empty
      end
      
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
  
  # Test suite for DELETE /seasons/:id
  describe 'DELETE /seasons/:id' do
    before { delete "/seasons/#{season_id}" }
    
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end