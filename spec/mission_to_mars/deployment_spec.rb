# frozen_string_literal: true

require 'mission_to_mars/compass_point'
require 'mission_to_mars/deployment'
require 'mission_to_mars/instruction'
require 'mission_to_mars/planet'
require 'mission_to_mars/robot'

RSpec.describe MissionToMars::Deployment do
  subject(:deployment) { described_class.new(robot, planet, instructions) }

  let(:planet) { MissionToMars::Planet.new(10, 10) }
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

  describe '#run!' do
    subject(:run!) { deployment.run! }

    it 'follows the path' do
      expect { run! }.
        to change { deployment.robot.x }.to(3).
        and change { deployment.robot.y }.to(8).
        and change { deployment.robot.direction }.to(MissionToMars::CompassPoint::WEST)
    end

    context 'with instructions that go off the grid' do
      let(:instructions) { [MissionToMars::Instruction::MOVE_FORWARD] * 20 }

      it 'stops at the edge of the grid' do
        expect { run! }.to change { deployment.robot.y }.to(10)
      end

      it 'leaves a scent at the last position' do
        expect { run! }.to change { planet.scent?(1, 10) }.to(true)
      end

      it 'marks the robot as lost' do
        expect { run! }.to change(deployment, :lost?).to(true)
      end

      context 'when there is already a scent at the last location' do
        before { planet.leave_scent(1, 10) }

        it 'stops at the edge of the grid' do
          expect { run! }.to change { deployment.robot.y }.to(10)
        end

        it 'does not mark the robot as lost' do
          expect { run! }.not_to change(deployment, :lost?)
        end
      end
    end
  end
end
