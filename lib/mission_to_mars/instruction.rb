# frozen_string_literal: true

require 'typesafe_enum'

module MissionToMars
  # Instruction represents a single instruction that a robot can follow.
  class Instruction < TypesafeEnum::Base
    new :MOVE_FORWARD, 'F'
    new :TURN_LEFT, 'L'
    new :TURN_RIGHT, 'R'
  end
end
