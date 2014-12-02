module Introflection
  module PackMethods
    refine Integer do
      # 32-bit unsigned, native endian (uint32_t).
      def as_uint32_t
        [self].pack('L')
      end

      # 8-bit unsigned char.
      def as_unsigned_char
        [self].pack('C')
      end
    end

    refine String do
      def as_space_padded_binary_string
        [self].pack('A*')
      end
    end

    refine Symbol do
      def as_space_padded_binstring
        to_s.as_space_padded_binstring
      end
    end

    def self.prepend_header(bin)
      size_frame = bin.bytesize.as_unsigned_char
      [size_frame, bin].join('')
    end
  end
end
