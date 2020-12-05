# frozen_string_literal: true

require 'typesafe_enum'

module MissionToMars
  # CompassPoint represents one of the four primary compass directions.
  class CompassPoint < TypesafeEnum::Base
    new :NORTH, 'N'
    new :EAST, 'E'
    new :SOUTH, 'S'
    new :WEST, 'W'
  end
end
