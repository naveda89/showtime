class ContentPurchaseOptionSerializer < ActiveModel::Serializer
  cache key: 'content_purchase_option', expires_in: 3.hours
  attributes :id, :price, :quality
end
