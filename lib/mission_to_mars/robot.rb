# frozen_string_literal: true

require_relative 'compass_point'

module MissionToMars
  # Robot represents a robot on the surface of Mars.
  class Robot
    def initialize(x, y, direction)
      @x = x
      @y = y
      @direction = direction
    end

    def self.parse(input)
      parts = input.split

      x = parts.fetch(0).to_i
      y = parts.fetch(1).to_i
      direction = CompassPoint.find_by_value(parts.fetch(2))

      new(x, y, direction)
    end

    attr_reader :x, :y, :direction

    def step(instruction)
      next_x, next_y = instruction.next_position(@x, @y, @direction)
      next_direction = instruction.next_direction(@direction)

      Robot.new(next_x, next_y, next_direction)
    end

    def to_s
      "#{@x} #{@y} #{@direction.value}"
    end
  end
end
