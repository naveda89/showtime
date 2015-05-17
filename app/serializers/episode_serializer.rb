class EpisodeSerializer < ActiveModel::Serializer
  cache key: 'episode', expires_in: 3.hours
  attributes :id, :num, :plot
end
