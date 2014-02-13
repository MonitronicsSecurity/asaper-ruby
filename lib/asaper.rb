require_relative 'asaper/configuration'
require 'asaper/builders/room'
require 'asaper/api/wrapper'
require 'awesome_print'

module Asaper
  def self.configure
    yield configuration if block_given?
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.room(&block)
    room_params = Asaper::Builders::Room.new(&block).hash
    ap room_params
    api_wrapper.create_room(room_params)
  end

  def self.api_wrapper
    Asaper::Api::Wrapper.new(configuration)
  end
end
