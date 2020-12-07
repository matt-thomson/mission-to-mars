# frozen_string_literal: true

require 'typesafe_enum'

module MissionToMars
  # CompassPoint represents one of the four primary compass directions.
  class CompassPoint < TypesafeEnum::Base
    # These are in clockwise order.
    new :NORTH, 'N'
    new :EAST, 'E'
    new :SOUTH, 'S'
    new :WEST, 'W'

    def anticlockwise
      CompassPoint.find_by_ord((ord - 1) % 4)
    end

    def clockwise
      CompassPoint.find_by_ord((ord + 1) % 4)
    end

    def move(x, y)
      case self
      when NORTH then [x, y + 1]
      when EAST then [x + 1, y]
      when SOUTH then [x, y - 1]
      when WEST then [x - 1, y]
      end
    end
  end
end
