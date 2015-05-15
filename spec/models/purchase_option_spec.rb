require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do

  # Validations
  it 'has a valid factory' do
    purchase_option= create(:purchase_option)
    expect(purchase_option).to be_valid
  end

end
