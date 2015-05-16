module Api
  module V1
    class ContentsController < ApiController

      has_scope :newest, type: :boolean
      has_scope :oldest, type: :boolean
      has_scope :by_type

      def index
        @contents = apply_scopes(Content).all
        respond_with(@contents)
      end

    end
  end
end

