require 'asaper/builders/base'

module Asaper
  module Builders
    class Task < Asaper::Builders::Base
      def initialize(type, &block)
        @hash = { type: type }
        yield self
      end

      def method_missing(name, *args, &block)
        new_attribute(:options, name.to_sym => args.first)
      end
    end
  end
end
