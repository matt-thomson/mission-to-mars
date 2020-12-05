# frozen_string_literal: true

require 'mission_to_mars/planet'

RSpec.describe MissionToMars::Planet do
  describe '.parse' do
    subject(:planet) { described_class.parse(input) }

    let(:input) { '5 3' }

    it 'parses the width and height properly' do
      expect(planet.width).to eq(5)
      expect(planet.height).to eq(3)
    end
  end
end
