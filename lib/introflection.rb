require 'socket'
require 'logger'

require 'introflection/core_ext'
require 'introflection/introflector'
require 'introflection/transmitter'

# A fancy tracing thing.
#
module Introflection
  # IntroflectionLogger. A global logger.
  ILogger = Logger.new(STDOUT)

  # Starts an introflection session. Transmits events to the Introflection event
  # server.
  # @return [true]
  def self.introflect
    ILogger.debug('Starting Introflection...')

    @introflector = Introflector.new
    @introflector.introflect

    ILogger.debug('Introflection is working')
    true
  end

  # Stops the introflection session. Does not attempt to send any events
  # anymore.
  # @return [true]
  def self.deintroflect
    @introflector.deintroflect
    true
  end
end
