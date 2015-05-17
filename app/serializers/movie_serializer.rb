class MovieSerializer < ContentSerializer
  attributes :type, :slug, :title, :plot

  has_many :content_purchase_options
end
