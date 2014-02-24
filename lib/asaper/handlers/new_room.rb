require 'asaper/builders/room'
require 'awesome_print'

module Asaper
  module Handlers
    class NewRoom
      attr :hash
      def initialize(api_wrapper, &block)
        @api_wrapper = api_wrapper
        room_params = Asaper::Builders::Room.new(&block).hash
        ap room_params
        @hash = api_wrapper.create_room(room_params)
      end
    end
  end
end
