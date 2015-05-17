class Purchase < ActiveRecord::Base
  # Constants
  ALIVE_TIME = 2.days

  # Associations
  belongs_to :user
  belongs_to :content_purchase_option
  has_one :content, through: :content_purchase_option

  # Validations
  validates_presence_of :user, :content_purchase_option
  validates_uniqueness_of :user_id, scope: :content_purchase_option_id,
                          if: Proc.new { |purchase| purchase.alive? },
                          message: 'has this content purchase option still alive'

  # Delegators
  delegate :active, to: :content_purchase_option
  delegate :price, to: :content_purchase_option
  delegate :quality, to: :content_purchase_option

  # Scopes
  scope :alive, -> { where('created_at >= ?', Time.now - ALIVE_TIME) }
  scope :recent, -> { order('created_at DESC') }

  # Instance methods
  def alive?
    return self.new_record? unless self.created_at
    self.created_at >= (Time.now - ALIVE_TIME)
  end
end
