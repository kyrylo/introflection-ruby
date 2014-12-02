module Introflection
  class Tracer
    def initialize
      @transmitter = Transmitter.new
      @trace = set_trace
    end

    def enable
      @trace.enable
      ILogger.debug('Introflection is ON')
    end

    def disable
      @trace.disable
      @transmitter.disable
    end

    private

    def set_trace
      TracePoint.new do |trace_point|
        begin
          @transmitter.transmit Packer.new(trace_point).pack
        rescue => ex
          begin
            puts "#{ex.class}: #{ex.message}", ex.backtrace[0..5]
            disable
          rescue => ex2
            ILogger.debug("Introflection has crashed abnormally")
            puts "#{ex2.class}: #{ex2.message}", ex2.backtrace[0..5]
            exit!
          end
        end
      end
    end
  end
end
