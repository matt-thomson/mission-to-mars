# frozen_string_literal: true

require 'typesafe_enum'

module MissionToMars
  # Instruction represents a single instruction that a robot can follow.
  class Instruction < TypesafeEnum::Base
    new :MOVE_FORWARD, 'F'
    new :TURN_LEFT, 'L'
    new :TURN_RIGHT, 'R'

    def next_direction(direction)
      case self
      when MOVE_FORWARD then direction
      when TURN_LEFT then direction.anticlockwise
      when TURN_RIGHT then direction.clockwise
      end
    end

    def next_position(x, y, direction)
      case self
      when MOVE_FORWARD then direction.move(x, y)
      when TURN_LEFT, TURN_RIGHT then [x, y]
      end
    end
  end
end
