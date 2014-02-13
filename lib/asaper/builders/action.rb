require 'asaper/builders/base'
require 'asaper/builders/confirmation'
require 'asaper/builders/concerns/taskable'

module Asaper
  module Builders
    class Action < Asaper::Builders::Base
      include Concerns::Taskable

      def initialize(name, &block)
        @hash = { name: name }
        instance_eval(&block)
      end

      def button_color(color)
        new_attribute(:options, button_color: color)
      end

      def text_color(color)
        new_attribute(:options, text_color: color)
      end

      def confirmation(&block)
        new_attribute(:confirmation, Builders::Confirmation.new(&block).hash)
      end
    end
  end
end
