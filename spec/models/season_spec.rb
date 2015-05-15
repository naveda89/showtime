require 'rails_helper'

RSpec.describe Season, type: :model do

  # Associations
  it { should have_many(:episodes) }

  # Validations
  it 'has a valid factory' do
    season = create(:season)
    expect(season).to be_valid
    # With episodes
    season_with_episodes = create(:season_with_episodes)
    expect(season_with_episodes).to be_valid
  end

end
