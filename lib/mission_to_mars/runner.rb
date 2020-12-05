module MissionToMars
  class Runner
    def initialize(output: $stdout)
      @output = output
    end

    def run
      @output.puts 'hello, world'
    end
  end
end
