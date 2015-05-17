require 'rails_helper'
require 'airborne'

RSpec.describe Api::V1::ContentsController, type: :controller do

  describe 'GET #index' do

    let!(:movie) { create(:movie) }
    let!(:season) { create(:season) }

    it 'returns 200 response' do
      get :index, format: :json
      expect_status 200
    end

    it 'returns valid contents' do
      get :index, format: :json
      expect_json_sizes({contents: 2})
      expect_json_types('contents.*', {type: :string, slug: :string, title: :string, url: :string, content_purchase_options: :array})
    end

    describe '/movies' do
      it 'returns all movies' do
        get :index, by_type: 'Movie', format: :json
        expect_status 200
        expect_json_sizes({contents: 1})
      end
    end

    describe '/seasons' do
      it 'returns all seasons' do
        get :index, by_type: 'Season', format: :json
        expect_status 200
        expect_json_sizes({contents: 1})
      end
    end

  end

  describe 'GET #show' do

    it 'returns 200 response' do
      content = create(:content)
      get :show, format: :json, id: content.id
      expect_status 200
    end

    describe '/movies' do
      it 'returns movie' do
        movie = create(:movie)
        get :show, id: movie.id, by_type: 'Movie', format: :json
        expect_json_keys('movie', [:type, :slug, :title, :plot, :content_purchase_options])
        expect_status 200
      end
    end

    describe '/seasons' do
      it 'returns season' do
        season = create(:season)
        get :show, id: season.id, by_type: 'Season', format: :json
        expect_json_keys('season', [:type, :slug, :title, :plot, :episodes, :content_purchase_options])
        expect_status 200
      end
    end

  end

end
