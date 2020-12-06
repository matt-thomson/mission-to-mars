# frozen_string_literal: true

module MissionToMars
  # Deployment represents a robot deployed onto a planet to run a set of instructions.
  class Deployment
    def initialize(robot, planet, instructions)
      @robot = robot
      @planet = planet
      @instructions = instructions
    end

    def run!
      @instructions.each do |instruction|
        break if @robot.lost?

        @robot.step!(instruction, @planet)
      end
    end

    attr_reader :robot
  end
end
