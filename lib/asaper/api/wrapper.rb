require 'httparty'
require 'active_support/hash_with_indifferent_access'

module Asaper
  module Api
    class Wrapper
      include HTTParty

      base_uri Asaper.configuration.api_url

      def self.create_room(room_args)
        ActiveSupport::HashWithIndifferentAccess.new(post(url("/rooms"), query: room_args))
      end

      private
      def self.url(url)
        "#{url}?API-KEY=#{Asaper.configuration.api_key}"
      end
    end
  end
end

