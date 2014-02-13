require_relative 'asaper/client'
require_relative 'asaper/configuration'

module Asaper
  def self.configure
    yield configuration if block_given?
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
