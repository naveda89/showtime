class ContentSerializer < ActiveModel::Serializer
  attributes :type, :slug, :title, :plot, :url

  has_many :content_purchase_options
  def content_purchase_options
    object.content_purchase_options.active
  end

  def url
    api_v1_content_path(object)
  end
end
