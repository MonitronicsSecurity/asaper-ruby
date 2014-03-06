require 'asaper/builders/nested_options'

module Asaper
  module Builders
    module Concerns
      module Optionable
        def method_missing(name, *args, &block)
          if block_given?
            new_attribute(:options, name.to_sym => Builders::NestedOptions.new(&block).hash)
          elsif args.count > 1
            new_array_attribute(:options, name.to_sym => args.first)
          else
            new_attribute(:options, name.to_sym => args.first)
          end
        end
      end
    end
  end
end
