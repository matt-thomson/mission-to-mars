# frozen_string_literal: true

RSpec.describe MissionToMars::Runner do
  subject(:runner) { described_class.new(path: path, output: output) }

  let(:path) { 'spec/fixtures/example.txt' }
  let(:output) { StringIO.new }

  describe '#run' do
    subject(:run) { runner.run }

    let(:expected_output) do
      <<~OUTPUT
        1 1 E
        3 3 N LOST
        2 3 S
      OUTPUT
    end

    it 'outputs the result of the robots following the instructions' do
      run

      expect(output.string).to eq(expected_output)
    end
  end
end
