module Api
  module V1
    class PurchasesController < ApiController

      # Callbacks
      skip_before_filter :verify_authenticity_token, only: :create
      before_filter :load_user

      # Scopes
      # Pagination
      has_scope :page, default: 1

      def index
        @purchases = purchases
        respond_with :api, :v1, @purchases, root: 'purchases'
      end

      def show
        @purchase = purchases.find(params[:id])
        respond_with :api, :v1, @purchase, root: 'purchase'
      end

      def create
        @purchase = purchases.create(content_purchase_option_id: params[:content_purchase_option_id])
        return respond_with :api, :v1, @purchase, root: 'purchase' if @purchase.valid?
        render text: @purchase.errors.to_json, status: :unprocessable_entity
      end

      private
      def purchases
        @purchases ||= apply_scopes(@purchases_user.purchases.alive.recent)
      end

      def load_user
        return if @purchases_user = User.find_by_id(params[:user_id])
        render json: { error: 'user id required' }, status: :forbidden
      end

    end
  end
end

