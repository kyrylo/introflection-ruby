module Introflection
  class Message
    START_MARK = "introflection".force_encoding(Encoding::UTF_8).freeze
    END_MARK = "\r\n".force_encoding(Encoding::UTF_8).freeze

    def initialize(event)
      @event = event
      @data = nil
    end

    def dump
      [
        START_MARK,
        event_trigger,
        data_size,
        data,
        END_MARK
      ].join('')
    end

    private

    def event_trigger
      pack([@event.trigger])
    end

    def data
      @data ||= @event.dump
    end

    def data_size
      pack([data.bytesize])
    end

    def pack(entity)
      entity.pack('C')
    end
  end

  class EventServer
    def initialize
      @events_sent = 0
      @connection = TCPSocket.new('localhost', 7331)
    end

    def send(event)
      @connection.puts(Message.new(event).dump)
      @events_sent += 1
      Logger.debug("EventServer #{@events_sent} sent: #{event}")
    end

    def disable
      @connection.close
    end
  end
end
