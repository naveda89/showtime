class Content < ActiveRecord::Base
  # Slug
  include FriendlyId
  friendly_id :title, use: :slugged

  # Associations
  has_many :content_purchase_options
  has_many :purchase_options, through: :content_purchase_options
  has_many :purchases, through: :content_purchase_options

  # Validations
  validates_presence_of :title, :plot, :slug
  validates_uniqueness_of :slug
end
