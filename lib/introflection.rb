require 'socket'
require 'logger'
require 'thread'

require 'introflection/core_ext'
require 'introflection/pack_methods'
require 'introflection/packer'
require 'introflection/tracer'
require 'introflection/introflector'
require 'introflection/transmitter'

# A fancy tracing thing.
#
module Introflection
  # IntroflectionLogger. A global logger.
  ILogger = Logger.new(STDOUT)

  # Starts an introflection session. Transmits events to the Introflection event
  # server.
  # @see #deintroflect
  # @return [Boolean]
  def self.introflect
    return false if @introflecting

    ILogger.debug('Starting Introflection')

    @introflector = Introflector.new
    if @introflector.introflect
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

    @introflector.deintroflect
    @introflecting = false
    true
  end
end
