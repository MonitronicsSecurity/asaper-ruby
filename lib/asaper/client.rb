module Asaper
  class TaskBuilder
    attr_reader :task
    def initialize(type, &block)
      @task = { type: type }
      instance_eval(&block)
    end

    def message(message)
      @task[:options] ||= {}
      @task[:options].merge!(message: message)
    end
  end

  class DuressBuilder
    attr_reader :duress

    def initialize(code, &block)
      @duress = { code: code }
      instance_eval(&block)
    end

    def task(type, &block)
      @duress[:tasks] = []
      @duress[:tasks] << TaskBuilder.new(type, &block).task
    end
  end

  class RoomBuilder
    attr_reader :room

    def initialize(&block)
      @room = Hash.new
      instance_eval(&block)
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

    def duress(code, &block)
      @room[:duress] = DuressBuilder.new(code, &block).duress
    end

    private
    def new_attribute(attribute, value)
      @room[attribute] ||= {}
      @room[attribute].merge!(value)
    end
  end

  class Client
    def room(&block)
      RoomBuilder.new(&block).room
    end
  end
end
