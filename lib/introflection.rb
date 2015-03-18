require 'nesting'

require 'socket'
require 'logger'
require 'thread'
require 'forwardable'

require 'introflection/core_ext'

# require 'introflection/trace'
# require 'introflection/trace_manager'

require 'introflection/module_space'
require 'introflection/module_space/module_unit'
require 'introflection/module_space/core_modules'

require 'introflection/event'
require 'introflection/event/module_added'

require 'introflection/event_server'
# require 'introflection/trace_event'
require 'introflection/introflector'

# A fancy tracing thing.
#
module Introflection
  # Starts an introflection session. Transmits events to the Introflection event
  # server.
  # @see #deintroflect
  # @return [Boolean]
  def self.introflect
    return false if @introflecting

    @introflector = Introflector.new
    if @introflector.start_introflecting
      @introflecting = true
    end

    @introflecting
  end

  # Stops the introflection session. Does not attempt to send any events
  # anymore.
  # @see #introflect
  # @return [Boolean]
  def self.deintroflect
    return false unless @introflecting

    @introflector.stop_introflecting
    @introflecting = false

    true
  end
end
