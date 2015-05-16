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

  # Scopes
  scope :newest, -> { order('created_at DESC') }
  scope :oldest, -> { order('created_at ASC') }
  scope :by_type, proc { |t| where('type is ?', t) }

end
