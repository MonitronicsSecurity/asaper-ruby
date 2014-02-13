require 'asaper/builders/task'
module Asaper
  module Builders
    module Concerns
      module Taskable
        def task(type, &block)
          new_array_attribute(:tasks, Builders::Task.new(type, &block).hash)
        end
      end
    end
  end
end
