class ContentSerializer < ActiveModel::Serializer
  attributes :type, :slug, :title, :plot
end
