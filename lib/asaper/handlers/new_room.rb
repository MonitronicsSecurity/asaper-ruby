require 'asaper/builders/room'

module Asaper
  module Handlers
    class NewRoom
      def initialize(api_wrapper, &block)
        @api_wrapper = api_wrapper
        room_params = Asaper::Builders::Room.new(&block).hash
        api_wrapper.create_room(room_params)
      end
    end
  end
end
