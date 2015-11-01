module Introflection
  class Event
    extend Forwardable

    def_delegator :@data, :to_s

    TRIGGERS = {
      :module_added => 0
    }

    def initialize(trigger: nil, data: {})
      @trigger = trigger
      @trigger_code = TRIGGERS[trigger]
      @data = data
    end

    def dump
      event = case @trigger
              when :module_added
                Event::ModuleAdded.new(@data)
              when :default
                raise NotImplementedError
              end

      Marshal.dump(event.pack)
    end

    def trigger
      @trigger_code
    end
  end
end
