module Introflection
  class Packer
    using PackMethods

    def initialize(trace_point)
      @trace_point = trace_point
    end

    def pack
      [pack_method_id, pack_lineno].compact.join('')
    end

    private

    def pack_method_id
      if @trace_point.method_id
        binstr = @trace_point.method_id.as_space_padded_binstring
        PackMethods.prepend_header(binstr)
      end
    end

    def pack_lineno
      @trace_point.lineno.as_uint32_t
    end
  end
end
