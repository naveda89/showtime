class Purchase < ActiveRecord::Base
  # Constants
  ALIVE_TIME = 2.days

  # Associations
  belongs_to :user
  belongs_to :content_purchase_option
  has_one :content, through: :content_purchase_option

  # Validations
  validates_presence_of :user, :content_purchase_option

  # Delegators
  delegate :active, to: :content_purchase_option
  delegate :price, to: :content_purchase_option
  delegate :quality, to: :content_purchase_option

  # Scopes
  scope :alive, -> { where('created_at >= ?', Time.now - ALIVE_TIME) }

  # Instance methods
  def alive?
    self.created_at >= Time.now - ALIVE_TIME
  end
end
