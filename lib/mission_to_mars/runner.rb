# frozen_string_literal: true

require_relative 'instruction'
require_relative 'planet'
require_relative 'robot'

module MissionToMars
  # Entry point to the application.
  class Runner
    def initialize(path:, output: $stdout)
      @path = path
      @output = output
    end

    def run
      File.open(@path) do |file|
        planet = Planet.parse(file.each_line.first)
        @output.puts "width: #{planet.width}, height: #{planet.height}"

        file.each_line.each_slice(2) do |robot_line, instructions_line|
          robot = Robot.parse(robot_line)
          instructions = instructions_line.strip.chars.map { |instruction| Instruction.find_by_value(instruction) }

          deploy_robot(robot, instructions)
        end
      end
    end

    private

    def deploy_robot(robot, instructions)
      @output.puts "robot at (#{robot.x}, #{robot.y}) facing #{robot.direction.key}"

      instructions.each do |instruction|
        @output.puts "instruction: #{instruction.key}"
      end
    end
  end
end
