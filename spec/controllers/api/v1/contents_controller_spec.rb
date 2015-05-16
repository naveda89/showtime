require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do
  render_views
  let(:json) { JSON.parse(response.body) }

  describe 'GET #index' do

    it 'returns all contents' do
      movie1 = create(:movie)
      movie2 = create(:movie)

      get :index, format: :json
      expect(response.status).to eq 200

      movie_titles = json.map { |m| m['title'] }
      expect(movie_titles).to match_array([movie1.title, movie2.title])
    end

    it 'renders the :index template' do
      get :index, format: :json
      expect(response).to render_template :index
    end

  end

end
