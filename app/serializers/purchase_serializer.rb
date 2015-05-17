class PurchaseSerializer < ActiveModel::Serializer

  attributes :id, :price, :quality, :created_at

  has_one :user, embed: :ids
  has_one :content

end
