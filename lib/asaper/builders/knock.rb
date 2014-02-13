require 'asaper/builders/base'
require 'asaper/builders/confirmation'
require 'asaper/builders/concerns/taskable'

module Asaper
  module Builders
    class Knock < Asaper::Builders::Base
      include Concerns::Taskable

      def initialize(run_in, &block)
        @hash = { run_in: run_in }
        instance_eval(&block)
      end
    end
  end
end
