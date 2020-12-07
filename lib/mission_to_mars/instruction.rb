# frozen_string_literal: true

require 'typesafe_enum'

module MissionToMars
  # Instruction represents a single instruction that a robot can follow.
  class Instruction < TypesafeEnum::Base
    new :MOVE_FORWARD, 'F' do
      def next_direction(direction)
        direction
      end

      def next_position(x, y, direction)
        direction.move(x, y)
      end
    end

    new :TURN_LEFT, 'L' do
      def next_direction(direction)
        direction.anticlockwise
      end

      def next_position(x, y, _direction)
        [x, y]
      end
    end

    new :TURN_RIGHT, 'R' do
      def next_direction(direction)
        direction.clockwise
      end

      def next_position(x, y, _direction)
        [x, y]
      end
    end
  end
end
