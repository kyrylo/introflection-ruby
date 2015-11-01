module Introflection
  class ModuleSpace
    class ModuleUnit
      extend Forwardable
      def_delegators :@mod, :name

      def initialize(mod)
        @mod = mod
      end

      def name
        prepare_for_serialization(@mod.name)
      end

      def type
        @mod.class.name.downcase.to_sym
      end

      def origin
        if on_core_modules_list?
          :core
        elsif on_stdlib?
          :stdlib
        else
          :user
        end
      end

      def nesting_level
        Nesting.of(@mod)
      end

      def inherits_from
        if class? && @mod.superclass
          superclass = @mod.superclass
          if superclass.name
            superclass.name.to_sym
          else
            superclass.inspect
          end
        end
      end

      def parent
        if (parents = Nesting.parents(@mod)) && parents.any?
          parents.first.__id__
        else
          Object.__id__
        end
      end

      def included_mods
        @mod.included_modules.map(&:to_s)
      end

      def id
        @mod.__id__
      end

      def to_s
        "{#{id}, #{name}, #{nesting_level}, #{parent}}"
      end

      private

      def on_core_modules_list?
        CORE_MODULES.include?(@mod) || CORE_MODULES.include?(@mod.name)
      end

      def on_stdlib?
        methods = @mod.methods(false)
        if methods.any?
          location = @mod.method(methods.first).source_location
          if location && location.first.match(%r{lib/ruby/2\.[1-9]\.[0-9]/.+.rb})
            return true
          end
        end

        false
      end

      def class?
        @mod.class == Class
      end

      def prepare_for_serialization(mod_name)
        convert_to_utf8(demodulize(mod_name))
      end

      def demodulize(mod_name)
        mod_name.split('::').last
      end

      def convert_to_utf8(str)
        str.force_encoding(Encoding::UTF_8)
      end
    end
  end
end
