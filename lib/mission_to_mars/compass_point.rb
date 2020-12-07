# frozen_string_literal: true

require 'typesafe_enum'

module MissionToMars
  # CompassPoint represents one of the four primary compass directions.
  class CompassPoint < TypesafeEnum::Base
    # These are in clockwise order.
    new :NORTH, 'N' do
      def move(x, y)
        [x, y + 1]
      end
    end

    new :EAST, 'E' do
      def move(x, y)
        [x + 1, y]
      end
    end

    new :SOUTH, 'S' do
      def move(x, y)
        [x, y - 1]
      end
    end

    new :WEST, 'W' do
      def move(x, y)
        [x - 1, y]
      end
    end

    def anticlockwise
      CompassPoint.find_by_ord((ord - 1) % 4)
    end

    def clockwise
      CompassPoint.find_by_ord((ord + 1) % 4)
    end
  end
end
