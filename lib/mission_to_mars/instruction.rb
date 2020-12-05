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
      when TURN_LEFT then direction.anticlockwise
      when TURN_RIGHT then direction.clockwise
      end
    end
  end
end
