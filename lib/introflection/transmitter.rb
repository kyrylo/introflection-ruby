class Transmitter
  PACK_METHODS = {
    signed_64: 'q'
  }

  def initialize
    @socket = TCPSocket.new('localhost', 7331)
    @listener_process = start_listening
  end

  def transmit(obj)
    ILogger.debug("Transmitting #{obj}")
    @socket.write([obj].pack(PACK_METHODS[:signed_64]))
  end

  def disable
    @socket.close
    Process.kill('INT', @listener_process)
  end

  private

  def start_listening
    fork do
      ILogger.debug("Started listening")
      while line = @socket.gets
        ILogger.debug("Received #{line.unpack(PACK_METHODS[:signed_64])}")
      end
    end
  end
end
