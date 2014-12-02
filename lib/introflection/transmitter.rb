module Introflection
  class Transmitter
    def initialize
      @connection = TCPSocket.new('localhost', 7331)
    end

    def transmit(datum)
      @connection.puts(datum)
    end

    def disable
      @connection.close
    end
  end
end
