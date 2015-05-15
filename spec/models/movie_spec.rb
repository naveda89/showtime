require 'rails_helper'

RSpec.describe Movie, type: :model do

  # Validations
  it 'has a valid factory' do
    movie = create(:movie)
    expect(movie).to be_valid
  end

end
