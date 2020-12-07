# frozen_string_literal: true

require_relative 'deployment'
require_relative 'instruction'
require_relative 'planet'
require_relative 'robot'

module MissionToMars
  # Entry point to the application.
  class Runner
    def initialize(input:, output: $stdout)
      @input = input
      @output = output
    end

    def run
      planet = Planet.parse(input_lines.first)

      input_lines.each_slice(2) do |robot_line, instructions_line|
        deploy(planet, robot_line, instructions_line)
      end
    end

    private

    def deploy(planet, robot_line, instructions_line)
      robot = Robot.parse(robot_line)
      instructions = instructions_line.chars.map { |instruction| Instruction.find_by_value(instruction) }

      deployment = Deployment.new(robot, planet, instructions)
      deployment.run!

      @output.puts(deployment)
    end

    def input_lines
      @input.each_line.lazy.map(&:strip).reject(&:empty?)
    end
  end
end
