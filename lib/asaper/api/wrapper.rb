require 'httparty'

module Asaper
  module Api
    class Wrapper
      include HTTParty

      headers 'Content-Type' => 'application/json'

      def initialize(config)
        @base_url = config.api_url
        @api_key = config.api_key
      end

      def create_room(room_args)
        self.class.post(url("/rooms"), body: room_args.to_json)
      end

      def new_message(room_token, message_args)
        self.class.post(url("/rooms/#{room_token}/alarm_messages"), body: message_args.to_json)
      end

      def new_member_message(room_token, message_args)
        self.class.post(url("/rooms/#{room_token}/messages"), body: message_args.to_json)
      end

      def activate_member(args)
        self.class.post(url("/pusher/webhook"), body: args.to_json)
      end

      def account_info(room_token)
        self.class.get(url("/rooms/#{room_token}/account_info"))
      end

      def resolve_room(room_token, args)
        self.class.put(url("/rooms/#{room_token}/resolve"), body: args.to_json)
      end

      private
      def url(url)
        "#{@base_url}#{url}?API-KEY=#{@api_key}"
      end
    end
  end
end
