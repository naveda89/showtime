class ContentPurchaseOption < ActiveRecord::Base
  # Asociations
  belongs_to :content
  belongs_to :purchase_option
  has_many :purchases
  has_many :purchasers, through: :purchases, class_name: 'User', source: :user

  # Validations
  validates_presence_of :price

  # Delegators
  delegate :quality, to: :purchase_option
  delegate :price, to: :purchase_option, prefix: true, allow_nil: true

  # Scopes
  scope :active, -> { where(active: true) }

  # Callbacks
  before_validation :set_inherited_price

  def inactive!
    update_attributes(active: false)
  end

  private
  def set_inherited_price
    self.price = purchase_option_price
  end
end
