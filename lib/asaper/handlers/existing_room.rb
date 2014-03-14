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

      def member_message(message, member_token)
        message_args = { content: message, member_token: member_token }
        @api_wrapper.new_member_message(@token, message_args)
      end

      def activate_member(member_id)
        args = { channel: "presence-#{@token}", user_id: member_id}
        @api_wrapper.activate_member(args)
      end

      def resolve(message)
        @api_wrapper.resolve_room(@token, message: message)
      end

      def account_info
        @api_wrapper.account_info(@token)
      end
    end
  end
end
