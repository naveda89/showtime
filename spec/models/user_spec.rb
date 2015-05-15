require 'rails_helper'

RSpec.describe User, type: :model do

  # Validations
  it 'has a valid factory' do
    user = create(:user)
    expect(user).to be_valid
  end

end
