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

    def deploy_robot!(robot, instructions)
      instructions.each { |instruction| robot.step!(instruction, self) }
    end

    def on_grid?(x, y)
      (0..@width).cover?(x) && (0..@height).cover?(y)
    end
  end
end
