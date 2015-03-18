module Introflection
  class TraceManager
    EVENTS = [
        :line,
        # :class,
        # :end,
        # :call,
        # :return,
        # :c_call,
        # :c_return,
        # :raise,
        # :b_call,
        # :b_return,
        # :thread_begin,
        # :thread_end
    ]

    def initialize(event_server)
      @event_server = event_server
      @tracers = []
    end

    def enable
      EVENTS.each do |tp_event|
        tracer = Tracer.new(tp_event)
        tracer.enable
        @tracers << tracer
      end
    end

    def disable
      @tracers.each(&:disable)
      @event_server.disable
    end
  end
end
