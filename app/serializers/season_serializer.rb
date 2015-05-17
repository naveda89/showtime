class SeasonSerializer < ContentSerializer
  attributes :type, :slug, :title, :plot

  has_many :content_purchase_options
  has_many :episodes
end
