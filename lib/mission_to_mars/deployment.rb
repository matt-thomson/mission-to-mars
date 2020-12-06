# frozen_string_literal: true

module MissionToMars
  # Deployment represents a robot deployed onto a planet to run a set of instructions.
  class Deployment
    def initialize(robot, planet, instructions)
      @robot = robot
      @planet = planet
      @instructions = instructions
      @lost = false
    end

    def run!
      @instructions.each do |instruction|
        next_robot = @robot.step(instruction)

        if @planet.on_grid?(next_robot.x, next_robot.y)
          @robot = next_robot
        else
          @lost = true
          break
        end
      end
    end

    attr_reader :robot

    def to_s
      result = robot.to_s
      result += ' LOST' if @lost

      result
    end
  end
end
