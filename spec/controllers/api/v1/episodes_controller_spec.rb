require 'rails_helper'

RSpec.describe Api::V1::EpisodesController, type: :controller do
  render_views
  let(:json) { JSON.parse(response.body) }

  describe 'GET #show' do

    it 'returns episode' do
      season = create(:season_with_episodes)
      episode = season.episodes.first

      get :show, season_id: season.id, id: episode.id, format: :json
      expect(response.status).to eq 200

      num = json['num']
      expect(num).to match(episode.num)
    end

    it 'renders the :show template' do
      season = create(:season_with_episodes)
      episode = season.episodes.first
      get :show, season_id: season.id, id: episode.id, format: :json

      expect(response).to render_template :show
    end

  end

end
