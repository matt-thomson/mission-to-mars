RSpec.describe MissionToMars::Runner do
  subject(:runner) { described_class.new(output: output) }

  let(:output) { StringIO.new }

  describe '#run' do
    subject(:run) { runner.run }

    it "outputs 'hello, world'" do
      run

      expect(output.string).to eq("hello, world\n")
    end
  end
end
