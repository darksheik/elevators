require 'Elevator'

describe 'initializing elevators' do
  elevator = Elevator.new(1,2)
  
  it 'should have an initial floor' do
    elevator.floor > 0
  end
  it 'should have a top floor' do
    elevator.top_floor > 0
  end
  it 'should have a bottom floor' do
    elevator.bottom_floor > 0
  end
end
