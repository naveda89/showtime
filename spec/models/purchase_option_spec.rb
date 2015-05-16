require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do

  # Associations
  it { should have_many(:content_purchase_options) }

  # Validations
  it { should validate_presence_of(:quality) }
  it { should validate_presence_of(:price) }
  it { should validate_uniqueness_of(:quality).scoped_to(:price) }
  it { should ensure_inclusion_of(:quality).in_array(%W(hd sd)) }

  it 'has a valid factory' do
    purchase_option = create(:purchase_option)
    expect(purchase_option).to be_valid
  end

end
