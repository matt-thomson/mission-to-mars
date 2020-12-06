# frozen_string_literal: true

require 'mission_to_mars/compass_point'
require 'mission_to_mars/instruction'
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

  describe '#step' do
    subject(:step) { robot.step(instruction) }

    let(:robot) { described_class.new(x, y, MissionToMars::CompassPoint::NORTH) }
    let(:x) { 3 }
    let(:y) { 2 }

    context 'with a turn left instruction' do
      let(:instruction) { MissionToMars::Instruction::TURN_LEFT }

      it 'does not change the position' do
        expect(step.x).to eq(x)
        expect(step.y).to eq(y)
      end

      it 'moves the direction one step anti-clockwise' do
        expect(step.direction).to eq(MissionToMars::CompassPoint::WEST)
      end
    end

    context 'with a turn right instruction' do
      let(:instruction) { MissionToMars::Instruction::TURN_RIGHT }

      it 'does not change the position' do
        expect(step.x).to eq(x)
        expect(step.y).to eq(y)
      end

      it 'moves the direction one step clockwise' do
        expect(step.direction).to eq(MissionToMars::CompassPoint::EAST)
      end
    end

    context 'with a move forward instruction' do
      let(:instruction) { MissionToMars::Instruction::MOVE_FORWARD }

      it 'moves one step in the specified direction' do
        expect(step.x).to eq(3)
        expect(step.y).to eq(3)
      end

      it 'does not change the direction' do
        expect(step.direction).to eq(MissionToMars::CompassPoint::NORTH)
      end
    end
  end
end
