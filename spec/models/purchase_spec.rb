require 'rails_helper'

RSpec.describe Purchase, type: :model do

  let(:purchase) { build(:purchase) }

  # Associations
  describe 'ActiveRecord associations' do
    it { should belong_to(:user) }
    it { should belong_to(:content_purchase_option) }
    it { should have_one(:content) }
  end

  # Validations
  describe 'ActiveRecord validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:content_purchase_option) }
  end

  # Factory
  it 'has a valid factory' do
    purchase = create(:purchase)
    expect(purchase).to be_valid
  end

  it 'has an alive checker' do
    purchase = build(:purchase)
    expect(purchase).to respond_to :alive?
  end

end
