class PurchaseSerializer < ActiveModel::Serializer
  cache key: 'purchase', expires_in: 3.hours
  attributes :id, :price, :quality, :created_at

  has_one :user, embed: :ids
  has_one :content
end
