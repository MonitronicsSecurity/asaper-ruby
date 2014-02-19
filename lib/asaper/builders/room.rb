require 'asaper/builders/base'
require 'asaper/builders/duress'
require 'asaper/builders/action'
require 'asaper/builders/concerns/taskable'

module Asaper
  module Builders
    class Room < Asaper::Builders::Base
      include Concerns::Taskable

      def initialize
        @hash = Hash.new
        yield self
      end

      def logo_url(url)
        new_attribute(:options, logo_url: url)
      end

      def title(title)
        new_attribute(:message, title: title)
      end

      def subtitle(subtitle)
        new_attribute(:message, subtitle: subtitle)
      end

      def content(content)
        new_attribute(:message, content: content)
      end

      def details(details)
        new_attribute(:message, details: details)
      end

      def icon(url)
        new_attribute(:icon, url)
      end

      def duress(code, &block)
        new_attribute(:duress, Builders::Duress.new(code, &block).hash)
      end

      def member(name, pin, *contact_methods)
        new_array_attribute(:members, name: name, pin: pin, contact_methods: contact_methods)
      end

      def action(name, &block)
        new_array_attribute(:actions, Builders::Action.new(name, &block).hash)
      end
    end
  end
end
