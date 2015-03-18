module Introflection
  class TraceEvent
    def self.pack_class_map(class_map)
      class_map.get_map.map do |fragment|
        Binfrag.new(fragment).pack
      end
    end

    def initialize(event, trace_point)
      @event = event
      @trace_point = trace_point
    end

    def pack
      [
        pack_event,
        pack_method_id,
        pack_path,
        pack_lineno,
        END_MSG_DELIM
      ].compact.join('')
    end

    private

    def pack_tag
      @tag.as_spd_binstr
    end

    def pack_method_id
      if @trace_point.method_id
        prepend_header(@trace_point.method_id.as_spd_binstr)
      else
        prepend_header('')
      end
    end

    def pack_path
      prepend_header(@trace_point.path.as_spd_binstr)
    end

    def pack_lineno
      @trace_point.lineno.as_unsigned_nbo32
    end
  end
end
