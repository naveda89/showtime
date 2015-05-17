require 'rails_helper'

RSpec.describe User, type: :model do

  # Associations
  describe 'ActiveRecord associations' do
    it { should have_many(:purchases) }
  end

  # Validations
  it 'has a valid factory' do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'has a valid "with purchases" factory' do
    user = create(:user_with_purchases)
    expect(user).to be_valid
  end

end
