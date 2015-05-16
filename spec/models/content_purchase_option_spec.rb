require 'rails_helper'

RSpec.describe ContentPurchaseOption, type: :model do

  # Associations
  it { should belong_to(:content) }
  it { should belong_to(:purchase_option) }
  it { should have_many(:purchases) }
  it { should have_many(:purchasers).through(:purchases) }

  # Validations
  it { should validate_presence_of(:price) }

  # Factory
  it 'has a valid factory' do
    content_purchase_option = create(:content_purchase_option)
    expect(content_purchase_option).to be_valid
  end

end
