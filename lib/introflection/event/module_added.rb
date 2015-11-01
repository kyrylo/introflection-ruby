module Introflection
  class Event
    class ModuleAdded
      def initialize(mod)
        @mod = mod
      end

      def code
        0
      end

      def pack
        h={ event: 0,
            data: {
              object_id: @mod.id,
              name: @mod.name,
              # type: @mod.type,
              # origin: @mod.origin,
              nesting: @mod.nesting_level,
              parent: @mod.parent
              # inherits_from: @mod.inherits_from.to_s.force_encoding(Encoding::UTF_8),
              # includes: @mod.included_mods.map { |s| s.force_encoding(Encoding::UTF_8)}
            }
          }
        h
      end
    end
  end
end
