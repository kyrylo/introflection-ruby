module Introflection
  class Trace
    extend Forwardable

    def_delegator :@trace, :disable

    attr_writer :event_server

    def initialize(tp_event)
      @tp_event = tp_event
    end

    def enable
      @trace = TracePoint.new(@tp_event) do |trace_point|
        send_to_event_server(@tp_event, trace_point)
      end
      @trace.enable
    end

    private

    def send_to_event_server(tp_event, trace_point)
      @event_server.send(TracePacker.pack(tp_event, trace_point))
    end
  end
end
