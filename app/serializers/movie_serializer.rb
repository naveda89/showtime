class MovieSerializer < ContentSerializer
  cache key: 'movie', expires_in: 3.hours
  attributes :type, :slug, :title, :plot

  has_many :content_purchase_options
end
