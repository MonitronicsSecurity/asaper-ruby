require_relative 'asaper/configuration'
require 'asaper/handlers/new_room'
require 'asaper/handlers/existing_room'
require 'asaper/api/wrapper'

module Asaper
  def self.configure
    yield configuration if block_given?
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.room(token = nil, &block)
    if token
      Asaper::Handlers::ExistingRoom.new(token, api_wrapper, &block)
    else
      Asaper::Handlers::NewRoom.new(api_wrapper, &block)
    end
  end

  def self.api_wrapper
    Asaper::Api::Wrapper.new(configuration)
  end
end
