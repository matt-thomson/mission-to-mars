# frozen_string_literal: true

module MissionToMars
  # Planet represents the grid of the surface of Mars.
  class Planet
    def initialize(width, height)
      @width = width
      @height = height
      @scents = Set.new
    end

    def self.parse(input)
      width, height = input.split.map(&:to_i)
      new(width, height)
    end

    attr_reader :width, :height

    def on_grid?(x, y)
      (0..@width).cover?(x) && (0..@height).cover?(y)
    end

    def scent?(x, y)
      @scents.include?([x, y])
    end

    def leave_scent(x, y)
      @scents << [x, y]
    end
  end
end
