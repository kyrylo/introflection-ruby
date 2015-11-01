# class Car
#   STEP = 5

#   attr_reader :distance

#   def initialize
#     turn_off

#     @distance = 0
#     @time = 0
#   end

#   def turn_on
#     return false if @engine == :on

#     @engine = :on
#     @speed = STEP
#     true
#   end

#   def faster
#     @speed += STEP
#     true
#   end

#   def slower
#     @speed -= STEP
#     true
#   end

#   def turn_off
#     return false if inactive?

#     @speed = 0
#     @engine = :off
#     true
#   end

#   def move
#     return false if inactive?

#     @time += 1
#     @distance += @speed
#     true
#   end

#   private

#   def inactive?
#     @engine == :off
#   end
# end

# require 'rails'

introflect

# car = Car.new
# car.turn_on
# car.move
# car.faster
# car.move
# car.slower
# car.move
# car.turn_off
# puts car.distance
