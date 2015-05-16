module Api
  module V1
    class EpisodesController < ApiController

      def show
        @season = Season.find(params[:season_id])
        @episode = @season.episodes.find(params[:id])
      end

    end
  end
end

