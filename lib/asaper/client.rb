require 'asaper/builders/room'
require 'asaper/api/wrapper'

module Asaper
  class Client
    def room(&block)
      Builders::Room.new(&block).hash
    end
  end
end
