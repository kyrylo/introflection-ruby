module Introflection
  class Introflector
    def initialize
      @tracer = Tracer.new
    end

    def introflect
      @tracer.enable
    end

    def deintroflect
      @tracer.disable
    end
  end
end
