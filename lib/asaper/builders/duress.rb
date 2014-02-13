require 'asaper/builders/base'
require 'asaper/builders/concerns/taskable'

module Asaper
  module Builders
    class Duress < Asaper::Builders::Base
      include Concerns::Taskable

      def initialize(code, &block)
        @hash = { code: code }
        instance_eval(&block)
      end
    end
  end
end
