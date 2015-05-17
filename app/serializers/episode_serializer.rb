class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :num, :plot, :url

  def url
    api_v1_season_episode_path(object.season, object)
  end
end
