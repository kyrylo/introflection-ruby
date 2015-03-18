module Introflection
  class Message
    BMARK = 'introflection'.freeze
    EMARK = "\r\n".freeze

    def initialize(event)
      @event = event
      @data = nil
    end

    def dump
      binding.pry
      [
        BMARK,
        event_trigger,
        data_size,
        data,
        EMARK
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
      @cnt = 0
      @connection = TCPSocket.new('localhost', 7331)
    end

    def send(event)
      @cnt += 1
      var = event.instance_variable_get(:@data)
      puts "SENDING #{var.id} #{var.name} (#{@cnt})"
      @connection.puts(Message.new(event).dump)
    end

    def disable
      @connection.close
    end
  end
end
