module Asaper
  module Builders
    class Base
      attr_reader :hash

      def new_attribute(attribute, value)
        if value.is_a?(Hash)
          hash[attribute] ||= {}
          hash[attribute].merge!(value)
        else
          hash[attribute] ||= value
        end
      end

      def new_array_attribute(attribute, value)
        if value.is_a?(Hash)
          hash[attribute] ||= []
          hash[attribute] << (value)
        else
          hash[attribute] ||= value
        end
      end
    end
  end
end
