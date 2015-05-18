require 'rails_helper'
require 'airborne'

RSpec.describe Api::V1::PurchasesController, type: :controller do

  let!(:user) { create(:user_with_purchases) }

  describe 'GET #index' do

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

    it 'returns only alive purchases' do
      Timecop.freeze(Date.today + 3.days) do
        get :index, user_id: user.id, format: :json
        expect_json_sizes({purchases: 0})
      end
    end
  end

  describe 'POST #create' do

    it 'returns created status' do
      movie_purchase_option = create(:movie_purchase_option)
      post :create, content_purchase_option_id: movie_purchase_option.id, format: :json, user_id: user.id
      expect_status 201
    end

    it 'returns forbidden when no user given' do
      movie_purchase_option = create(:movie_purchase_option)
      post :create, content_purchase_option_id: movie_purchase_option.id, format: :json
      expect_status 403
    end

    it 'returns error when trying to purchase the same alive content' do
      movie_purchase_option = create(:movie_purchase_option)
      post :create, content_purchase_option_id: movie_purchase_option.id, format: :json, user_id: user.id
      post :create, content_purchase_option_id: movie_purchase_option.id, format: :json, user_id: user.id
      expect_status 422
    end

  end

  describe 'GET #show' do

    it 'returns a 200 response' do
      purchase = user.purchases.first
      get :show, id: purchase.id, user_id: user.id, format: :json
      expect(response.status).to eq 200
    end

    it 'returns the purchase' do
      purchase = user.purchases.first
      get :show, id: purchase.id, user_id: user.id, format: :json
      expect_json_types({purchase: :object})
    end

    it 'returns a valid purchase' do
      purchase = user.purchases.first
      get :show, id: purchase.id, user_id: user.id, format: :json
      expect_json_types('purchase', {id: :integer, price: :string, quality: :string, content: :object})
    end
  end

end
