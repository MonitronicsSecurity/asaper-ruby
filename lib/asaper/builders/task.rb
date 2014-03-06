require 'asaper/builders/base'
require 'asaper/builders/concerns/optionable'

module Asaper
  module Builders
    class Task < Asaper::Builders::Base
      include Concerns::Optionable

      def initialize(type, &block)
        @hash = { type: type }
        yield self
      end
    end
  end
end
