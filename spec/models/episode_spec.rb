require 'rails_helper'

RSpec.describe Episode, type: :model do

  # Associations
  it { should belong_to(:season) }

  # Validations
  it { should validate_presence_of(:num) }
  it { should validate_uniqueness_of(:num) }
  it { should validate_numericality_of(:num) }

  it 'has a valid factory' do
    episode = create(:episode)
    expect(episode).to be_valid
  end

end
