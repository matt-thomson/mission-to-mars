# frozen_string_literal: true

module MissionToMars
  # Entry point to the application.
  class Runner
    def initialize(output: $stdout)
      @output = output
    end

    def run
      @output.puts 'hello, world'
    end
  end
end
