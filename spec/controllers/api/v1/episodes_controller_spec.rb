require 'rails_helper'
require 'airborne'

RSpec.describe Api::V1::EpisodesController, type: :controller do

  describe 'GET #show' do

    let!(:season) { create(:season_with_episodes) }
    let!(:episode) { season.episodes.first }

    it 'returns valid episode' do
      get :show, season_id: season.id, id: episode.id, format: :json

      expect_status 200
      expect_json_keys 'episode', [:id, :num, :plot]
      expect_json 'episode', { num: episode.num, plot: episode.plot }
    end

  end

end
