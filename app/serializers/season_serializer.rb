class SeasonSerializer < ContentSerializer
  cache key: 'season', expires_in: 3.hours
  attributes :type, :slug, :title, :plot

  has_many :content_purchase_options
  has_many :episodes
end
