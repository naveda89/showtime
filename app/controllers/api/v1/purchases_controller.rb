module Api
  module V1
    class PurchasesController < ApiController

      skip_before_filter :verify_authenticity_token, :only => :create

      def index
        @purchases = purchases
        respond_with :api, :v1, @purchases
      end

      def show
        @purchase = purchases.find(params[:id])
        respond_with :api, :v1, @purchase
      end

      def create
        @purchase = purchases.create(content_purchase_option_id: params[:content_purchase_option_id])
        respond_with :api, :v1, @purchase
      end

      private
      def purchases
        @purchases ||= apply_scopes(purchases_user.purchases.recent)
      end

      def purchases_user
        @purchases_user ||= User.find(params[:user_id])
      end

    end
  end
end

