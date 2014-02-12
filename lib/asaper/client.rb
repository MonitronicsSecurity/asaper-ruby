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
      @hash[:options] ||= {}
      @hash[:options] = { logo_url: url }
    end

    def title(title)
      @hash[:message] ||= {}
      @hash[:message].merge!(title: title)
    end

    def subtitle(subtitle)
      @hash[:message] ||= {}
      @hash[:message].merge!(subtitle: subtitle)
    end

    def content(content)
      @hash[:message] ||= {}
      @hash[:message].merge!(content: content)
    end
  end
end
