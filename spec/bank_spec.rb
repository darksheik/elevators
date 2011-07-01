require 'Bank'

describe 'the bank of elevators' do
  bank = Bank.new
  
  it 'should have at least one elevator' do
    bank.elevators.size > 0
  end
  it 'should have a number of elevators equal to the constant' do
    bank.elevator_count == bank.elevators.size
  end
end