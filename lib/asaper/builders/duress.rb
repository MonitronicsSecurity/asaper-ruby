require 'asaper/builders/base'
require 'asaper/builders/concerns/taskable'

module Asaper
  module Builders
    class Duress < Asaper::Builders::Base
      include Concerns::Taskable

      def initialize(code)
        @hash = { code: code }
        yield self
      end
    end
  end
end
