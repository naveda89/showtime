module Api
  module V1
    class ContentsController < ApiController

      def index
        @contents = Content.all
        respond_with(@contents)
      end

    end
  end
end

