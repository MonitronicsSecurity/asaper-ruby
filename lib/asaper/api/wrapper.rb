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

      private
      def url(url)
        "#{@base_url}#{url}?API-KEY=#{@api_key}"
      end
    end
  end
end
