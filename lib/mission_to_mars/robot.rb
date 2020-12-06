# frozen_string_literal: true

require_relative 'compass_point'

module MissionToMars
  # Robot represents a robot on the surface of Mars.
  class Robot
    def initialize(x, y, direction)
      @x = x
      @y = y
      @direction = direction
      @lost = false
    end

    def self.parse(input)
      parts = input.split

      x = parts.fetch(0).to_i
      y = parts.fetch(1).to_i
      direction = CompassPoint.find_by_value(parts.fetch(2))

      new(x, y, direction)
    end

    attr_reader :x, :y, :direction

    def step!(instruction, planet)
      next_x, next_y = instruction.next_position(@x, @y, @direction)

      if planet.on_grid?(next_x, next_y)
        @x = next_x
        @y = next_y
        @direction = instruction.next_direction(@direction)
      else
        @lost = true
      end
    end

    def lost?
      @lost
    end

    def to_s
      result = "#{@x} #{@y} #{@direction.value}"
      result += ' LOST' if lost?

      result
    end
  end
end
