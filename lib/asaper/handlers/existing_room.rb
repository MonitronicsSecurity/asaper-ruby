module Asaper
  module Handlers
    class ExistingRoom

      def initialize(token, api_wrapper)
        @token = token
        @api_wrapper = api_wrapper
        yield self
      end

      def message(message)
        message_args = { message: { content: message } }
        @api_wrapper.new_message(@token, message_args)
      end

      def resolve(message)
        @api_wrapper.resolve_room(@token, message: message)
      end
    end
  end
end
