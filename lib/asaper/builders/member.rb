require 'asaper/builders/base'

module Asaper
  module Builders
    class Member < Asaper::Builders::Base
      def initialize(&block)
        @hash = Hash.new
        yield self
      end

      def name(name)
        new_attribute(:name, name)
      end

      def pin(pin)
        new_attribute(:pin, pin)
      end

      def contact_methods(*contact_methods)
        new_array_attribute(:contact_methods, contact_methods)
      end

      def xid(xid)
        new_attribute(:xid, xid)
      end

      def owner(owner)
        new_attribute(:owner, owner)
      end

      def group(group)
        new_attribute(:group, group)
      end
    end
  end
end

