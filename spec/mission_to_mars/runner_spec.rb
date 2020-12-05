# frozen_string_literal: true

RSpec.describe MissionToMars::Runner do
  subject(:runner) { described_class.new(path: path, output: output) }

  let(:path) { 'spec/fixtures/example.txt' }
  let(:output) { StringIO.new }

  describe '#run' do
    subject(:run) { runner.run }

    it "outputs 'hello, world'" do
      run

      expect(output.string).to eq("width: 5, height: 3\n")
    end
  end
end
