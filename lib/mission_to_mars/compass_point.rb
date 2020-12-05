# frozen_string_literal: true

require 'typesafe_enum'

module MissionToMars
  # CompassPoint represents one of the four primary compass directions.
  class CompassPoint < TypesafeEnum::Base
    new :NORTH, 'N'
    new :EAST, 'E'
    new :SOUTH, 'S'
    new :WEST, 'W'

    def anticlockwise
      case self
      when NORTH then WEST
      when EAST then NORTH
      when SOUTH then EAST
      when WEST then SOUTH
      end
    end

    def clockwise
      case self
      when NORTH then EAST
      when EAST then SOUTH
      when SOUTH then WEST
      when WEST then NORTH
      end
    end
  end
end
