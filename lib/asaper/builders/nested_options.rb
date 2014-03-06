require 'asaper/builders/base'

module Asaper
  module Builders
    class NestedOptions < Asaper::Builders::Base
      def initialize(&block)
        @hash = { }
        yield self
      end

      def method_missing(name, *args, &block)
        if args.count > 1
          new_array_attribute(name.to_sym, args.first)
        else
          new_attribute(name.to_sym, args.first)
        end
      end
    end
  end
end
