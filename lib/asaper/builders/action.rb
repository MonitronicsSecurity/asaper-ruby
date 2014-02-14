require 'asaper/builders/base'
require 'asaper/builders/confirmation'
require 'asaper/builders/concerns/taskable'

module Asaper
  module Builders
    class Action < Asaper::Builders::Base
      include Concerns::Taskable

      def initialize(name)
        @hash = { name: name }
        yield self
      end

      def confirmation(&block)
        new_attribute(:options, confirmation: Builders::Confirmation.new(&block).hash)
      end

      def method_missing(name, *args, &block)
        new_attribute(:options, name.to_sym => args.first)
      end
    end
  end
end
