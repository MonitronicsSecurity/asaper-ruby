require 'asaper/builders/room'
module Asaper
  class Client
    def room(&block)
      Builders::Room.new(&block).hash
    end
  end
end
