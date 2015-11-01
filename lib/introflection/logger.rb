require 'logger'

module Introflection
  logger = ::Logger.new(STDOUT)
  logger.level = ::Logger::DEBUG
  Logger = logger
end
