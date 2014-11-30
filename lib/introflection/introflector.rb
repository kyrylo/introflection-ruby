class Introflector
  def initialize
    @trace = nil

    @transmitter = Transmitter.new
  end

  def introflect
    @trace = TracePoint.new do |tp|
      @transmitter.transmit(tp.lineno)
    end

    @trace.enable

  end

  def deintroflect
    @trace.disable
    @transmitter.disable
  end
end
