module Asaper
  class Client
    def initialize
      @hash = Hash.new
    end

    def room(&block)
      instance_eval(&block)
      @hash
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

    private
    def new_attribute(attribute, value)
      @hash[attribute] ||= {}
      @hash[attribute].merge!(value)
    end
  end
end
