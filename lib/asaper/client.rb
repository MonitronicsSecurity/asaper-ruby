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
      @hash[:options] = { logo_url: url }
    end

    def title(title)
      @hash.merge!(message: { title: title })
      p @hash
    end

    def subtitle(subtitle)
      @hash.merge!(message: { subtitle: subtitle })
      p @hash
    end

    def content(content)
      @hash.merge!(message: { content: content })
      p @hash
    end
  end
end
