require 'httparty'

module Asaper
  module Api
    class Wrapper
      include HTTParty

      base_uri Asaper.configuration.api_url

      def self.create_room(room_args)
        post(url("/rooms"), query: room_args)
      end

      private
      def self.url(url)
        "#{url}?API-KEY=#{Asaper.configuration.api_key}"
      end
    end
  end
end

