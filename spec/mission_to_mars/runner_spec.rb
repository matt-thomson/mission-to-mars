# frozen_string_literal: true

RSpec.describe MissionToMars::Runner do
  subject(:runner) { described_class.new(path: path, output: output) }

  let(:path) { 'spec/fixtures/example.txt' }
  let(:output) { StringIO.new }

  describe '#run' do
    subject(:run) { runner.run }

    let(:expected_output) do
      <<~OUTPUT
        width: 5, height: 3
        robot at (1, 1) facing EAST
      OUTPUT
    end

    it 'outputs a formatted version of the input' do
      run

      expect(output.string).to eq(expected_output)
    end
  end
end
