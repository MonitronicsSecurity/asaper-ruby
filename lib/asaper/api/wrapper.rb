require 'httparty'

module Asaper
  module Api
    class Wrapper
      include HTTParty

      def initialize(config)
        @base_url = config.api_url
        @api_key = config.api_key
      end

      def create_room(room_args)
        self.class.post(url("/rooms"), query: room_args)
      end

      def new_message(room_token, message_args)
        self.class.post(url("/rooms/#{room_token}/alarm_messages"), query: message_args)
      end

      def account_info(room_token)
        self.class.get(url("/rooms/#{room_token}/account_info"))
      end

      def resolve_room(room_token, args)
        self.class.put(url("/rooms/#{room_token}/resolve"), query: args)
      end

      private
      def url(url)
        "#{@base_url}#{url}?API-KEY=#{@api_key}"
      end
    end
  end
end
