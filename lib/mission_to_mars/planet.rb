# frozen_string_literal: true

module MissionToMars
  # Planet represents the grid of the surface of Mars.
  class Planet
    def initialize(width, height)
      @width = width
      @height = height
    end

    def self.parse(input)
      width, height = input.split.map(&:to_i)
      new(width, height)
    end

    attr_reader :width, :height
  end
end
