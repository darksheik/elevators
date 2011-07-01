require 'Elevator'

class Bank
  attr_accessor :elevators
  
  ELEVATOR_COUNT = 4

  # A singleton class which will hold all of the elevators
  def initialize
    @elevators = Array.new
    ELEVATOR_COUNT.times { add_elevator }
  end
  def add_elevator
    elevator = Elevator.new
    @elevators << elevator
  end

  def elevator_count
    ELEVATOR_COUNT
  end
end
