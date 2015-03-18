module Introflection
  class Introflector
    def initialize
      @event_server = EventServer.new
      @module_space = ModuleSpace.new
    end

    def start_introflecting
      @module_space.each_module do |mod|
        @event_server.send(Event.new(trigger: :module_added, data: mod))
      end

#      @tracer.enable
    end

    def stop_introflecting
#      @tracer.disable
    end
  end
end
