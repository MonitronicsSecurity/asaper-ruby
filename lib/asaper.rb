require_relative 'asaper/configuration'
autoload :Client, 'asaper/client'

module Asaper
  def self.configure
    yield configuration if block_given?
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
