class ContentSerializer < ActiveModel::Serializer
  cache key: 'content', expires_in: 3.hours
  attributes :type, :slug, :title, :plot

  has_many :content_purchase_options
  def content_purchase_options
    object.content_purchase_options.active
  end
end
