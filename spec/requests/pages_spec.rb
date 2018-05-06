require 'rails_helper'

RSpec.describe 'Pages API', type: :request do

  let!(:page) { create :page }

  before do
    host! 'localhost:3000'
  end

  describe 'GET api/v1/pages' do

    before { get '/api/v1/pages' }

    it 'returns pages' do
      expect(json).not_to be_empty
      expect(json['data'].size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /pages' do

    let(:valid_attributes) { { data: { type: 'pages', attributes: { url: 'http://jsonapi.org/examples/#error-objects-multiple-errors' } } } }
    let(:invalid_attributes) { { data: { type: 'pages', attributes: { url: 'https://publer.me/login' } } } }
    let(:headers) { { CONTENT_TYPE: 'application/vnd.api+json', ACCEPT: 'application/vnd.api+json' } }

    context 'when the request is valid' do
      before { post '/api/v1/pages', params: valid_attributes.to_json, headers: headers }

      it 'creates a page' do
        expect(json['data']['attributes']['url']).to eq('http://jsonapi.org/examples/#error-objects-multiple-errors')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/pages', params: invalid_attributes.to_json, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/has already been taken/)
      end
    end
  end
end
