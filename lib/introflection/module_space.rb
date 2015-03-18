module Introflection
  class ModuleSpace
    def initialize
      @modspace = []
    end

    def each_module(&block)
      if @modspace.empty?
        iterate_over_modules(block)
      else
        iterate_over_cached_modules(block)
      end
    end

    private

    def iterate_over_modules(callback)
      ObjectSpace.each_object(Module) do |mod|
        # Step 1. Filter anonymous modules.
        next unless mod.name

        # Step 2. Check whether it's a weird module like 'fatal'.
        begin
          Object.const_defined?(mod.name)
        rescue NameError
          next
        end

        # We're good to go now.
        module_unit = ModuleUnit.new(mod)
        @modspace << module_unit
        callback.call(module_unit)
      end
    end


    def iterate_over_cached_modules(callback)
      @modspace.each do |module_unit|
        callback.call(module_unit)
      end
    end
  end
end
