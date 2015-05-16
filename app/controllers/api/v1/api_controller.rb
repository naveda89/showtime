module Api
  module V1
    class ApiController < ApplicationController
      before_filter :restrict_access
      respond_to :json

      private
      def restrict_access
        # TODO: Apply some restrict access policy
      end
    end
  end
end