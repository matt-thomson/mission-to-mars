# frozen_string_literal: true

require 'mission_to_mars/compass_point'
require 'mission_to_mars/robot'

RSpec.describe MissionToMars::Robot do
  describe '.parse' do
    subject(:robot) { described_class.parse(input) }

    let(:input) { '3 2 N' }

    it 'parses the width and height properly' do
      expect(robot.x).to eq(3)
      expect(robot.y).to eq(2)
      expect(robot.direction).to eq(MissionToMars::CompassPoint::NORTH)
    end
  end
end
