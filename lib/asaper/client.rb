require 'asaper/builders/room'
require 'asaper/api/wrapper'

module Asaper
  class Client
    def room(&block)
      room_params = Builders::Room.new(&block).hash
      Asaper::Api::Wrapper.create_room(room_params)
    end
  end
end
