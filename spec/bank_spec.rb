require 'Bank'

describe 'initializing the bank of elevators' do
  bank = Bank.new
  
  it 'should have at least one elevator' do
    bank.elevators.size > 0
  end
  it 'should have a number of elevators equal to the constant' do
    bank.elevator_count == bank.elevators.size
  end
  it 'should have all idle elevators' do
    idle_elevators = 0
    bank.elevators.each do |elevator|
      if elevator.state == :idle then idle_elevators += 1 end
      end
    idle_elevators == bank.elevators.size      
  end
end