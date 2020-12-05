# frozen_string_literal: true

require 'mission_to_mars/compass_point'
require 'mission_to_mars/instruction'
require 'mission_to_mars/planet'
require 'mission_to_mars/robot'

RSpec.describe MissionToMars::Planet do
  describe '.parse' do
    subject(:planet) { described_class.parse(input) }

    let(:input) { '5 3' }

    it 'parses the width and height properly' do
      expect(planet.width).to eq(5)
      expect(planet.height).to eq(3)
    end
  end

  describe '#deploy_robot!' do
    subject(:deploy_robot) { planet.deploy_robot!(robot, instructions) }

    let(:planet) { described_class.new(10, 10) }
    let(:robot) { MissionToMars::Robot.new(1, 2, MissionToMars::CompassPoint::NORTH) }
    let(:instructions) do
      [
        MissionToMars::Instruction::MOVE_FORWARD,
        MissionToMars::Instruction::MOVE_FORWARD,
        MissionToMars::Instruction::MOVE_FORWARD,
        MissionToMars::Instruction::MOVE_FORWARD,
        MissionToMars::Instruction::TURN_RIGHT,
        MissionToMars::Instruction::MOVE_FORWARD,
        MissionToMars::Instruction::MOVE_FORWARD,
        MissionToMars::Instruction::MOVE_FORWARD,
        MissionToMars::Instruction::TURN_LEFT,
        MissionToMars::Instruction::MOVE_FORWARD,
        MissionToMars::Instruction::MOVE_FORWARD,
        MissionToMars::Instruction::TURN_LEFT,
        MissionToMars::Instruction::MOVE_FORWARD
      ]
    end

    it 'follows the path' do
      expect { deploy_robot }.
        to change(robot, :x).to(3).
        and change(robot, :y).to(8).
        and change(robot, :direction).to(MissionToMars::CompassPoint::WEST)
    end
  end
end
