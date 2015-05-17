class ContentSerializer < ActiveModel::Serializer
  attributes :type, :slug, :title, :plot

  has_many :content_purchase_options
  def content_purchase_options
    object.content_purchase_options.active
  end
end
