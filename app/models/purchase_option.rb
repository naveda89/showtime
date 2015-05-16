class PurchaseOption < ActiveRecord::Base
  # Associations
  has_many :content_purchase_options
  has_many :contents, through: :content_purchase_options

  # Validations
  validates_presence_of :quality, :price
  validates_uniqueness_of :quality, scope: :price
  validates_inclusion_of :quality, in: %w( hd sd )

  # Callbacks
  around_update :create_content_purchase_option_if_price_is_changed

  private

  def create_content_purchase_option_if_price_is_changed
    price_changed = self.price_changed?
    yield
    create_content_purchase_option if price_changed
  end

  def create_content_purchase_option
    content_purchase_options.each do |content_po|
      content_po.inactive!
      content_purchase_options.create(content: content_po.content, active: true)
    end
  end

end
