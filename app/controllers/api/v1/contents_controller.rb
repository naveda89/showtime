module Api
  module V1
    class ContentsController < ApiController

      # Scopes
      has_scope :newest, type: :boolean
      has_scope :oldest, type: :boolean, default: true
      has_scope :by_type

      def index
        @contents = scoped.all
        respond_with(@contents)
      end

      def show
        @content = scoped.find(params[:id])
      end

      private
      def scoped
        apply_scopes(Content)
      end

    end
  end
end

