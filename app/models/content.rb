class Content < ActiveRecord::Base
  # Slug
  include FriendlyId
  friendly_id :title, use: :slugged

  # Validations
  validates_presence_of :title, :plot, :slug
  validates_uniqueness_of :slug
end
