require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do
  render_views
  let(:json) { JSON.parse(response.body) }

  describe 'GET #index' do

    it 'returns all contents' do
      movie = create(:movie)
      season = create(:season)

      get :index, format: :json
      expect(response.status).to eq 200

      titles = json.map { |m| m['title'] }
      expect(titles).to match_array([movie.title, season.title])
    end

    it 'renders the :index template' do
      get :index, format: :json
      expect(response).to render_template :index
    end

  end

  describe 'GET #index/movies' do

    it 'returns all movies' do
      movie1 = create(:movie)
      movie2 = create(:movie)

      get :index, format: :json
      expect(response.status).to eq 200

      titles = json.map { |m| m['title'] }
      expect(titles).to match_array([movie1.title, movie2.title])
    end

    it 'renders the :index template' do
      get :index, format: :json
      expect(response).to render_template :index
    end

  end

  describe 'GET #index/seasons' do

    it 'returns all seasons' do
      season1 = create(:season)
      season2 = create(:season)

      get :index, format: :json
      expect(response.status).to eq 200

      titles = json.map { |m| m['title'] }
      expect(titles).to match_array([season1.title, season2.title])
    end

    it 'renders the :index template' do
      get :index, format: :json
      expect(response).to render_template :index
    end

  end

end
