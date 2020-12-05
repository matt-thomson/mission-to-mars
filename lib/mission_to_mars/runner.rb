# frozen_string_literal: true

require_relative 'planet'

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
      end
    end
  end
end
