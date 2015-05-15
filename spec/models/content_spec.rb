require 'rails_helper'

RSpec.describe Content, type: :model do

  # Validations
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:plot) }

  it 'has a valid factory' do
    content = create(:content)
    expect(content).to be_valid
  end

end
