require 'rails_helper'
require 'airborne'

RSpec.describe Api::V1::PurchasesController, type: :controller do

  let!(:user) { create(:user_with_purchases) }

  describe 'Get #index' do

    it 'returns a 200 response' do
      get :index, user_id: user.id, format: :json
      expect(response.status).to eq 200
    end

    it 'returns purchases' do
      get :index, user_id: user.id, format: :json
      expect_json_types({purchases: :array})
    end

    it 'returns valid purchases' do
      get :index, user_id: user.id, format: :json
      expect_json_types('purchases.*', {id: :integer, price: :string, quality: :string, content: :object})
    end
  end

end
