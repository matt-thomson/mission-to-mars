# frozen_string_literal: true

require 'mission_to_mars/compass_point'
require 'mission_to_mars/instruction'
require 'mission_to_mars/planet'
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

  describe '#step!' do
    subject(:step) { robot.step!(instruction, planet) }

    let(:robot) { described_class.new(x, y, MissionToMars::CompassPoint::NORTH) }
    let(:x) { 3 }
    let(:y) { 2 }
    let(:planet) { MissionToMars::Planet.new(5, 3) }

    context 'with a turn left instruction' do
      let(:instruction) { MissionToMars::Instruction::TURN_LEFT }

      it 'does not change the position' do
        expect { step }.not_to(change { [robot.x, robot.y] })
      end

      it 'moves the direction one step anti-clockwise' do
        expect { step }.to change(robot, :direction).to(MissionToMars::CompassPoint::WEST)
      end

      it 'does not mark the robot as lost' do
        expect { step }.not_to change(robot, :lost?)
      end
    end

    context 'with a turn right instruction' do
      let(:instruction) { MissionToMars::Instruction::TURN_RIGHT }

      it 'does not change the position' do
        expect { step }.not_to(change { [robot.x, robot.y] })
      end

      it 'moves the direction one step clockwise' do
        expect { step }.to change(robot, :direction).to(MissionToMars::CompassPoint::EAST)
      end

      it 'does not mark the robot as lost' do
        expect { step }.not_to change(robot, :lost?)
      end
    end

    context 'with a move forward instruction' do
      let(:instruction) { MissionToMars::Instruction::MOVE_FORWARD }

      it 'moves one step in the specified direction' do
        expect { step }.to change { [robot.x, robot.y] }.to([3, 3])
      end

      it 'does not change the direction' do
        expect { step }.not_to change(robot, :direction)
      end

      it 'does not mark the robot as lost' do
        expect { step }.not_to change(robot, :lost?)
      end
    end

    context 'with an instruction to move off the grid' do
      let(:instruction) { MissionToMars::Instruction::MOVE_FORWARD }
      let(:y) { 3 }

      it 'does not change the position' do
        expect { step }.not_to(change { [robot.x, robot.y] })
      end

      it 'does not change the direction' do
        expect { step }.not_to change(robot, :direction)
      end

      it 'marks the robot as lost' do
        expect { step }.to change(robot, :lost?).to(true)
      end
    end
  end
end
