class ContentPurchaseOptionSerializer < ActiveModel::Serializer
  attributes :id, :price, :quality, :purchase_url

  def purchase_url
    api_v1_content_purchase_option_purchase_path(object)
  end
end
