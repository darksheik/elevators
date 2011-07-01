require_relative 'Elevator'

class Bank
  attr_accessor :elevators
  attr_accessor :requests
  
  ELEVATOR_COUNT = 4
  TOP_FLOOR = 40

  # A singleton class which will hold all of the elevators
  def initialize   
    @requests = Hash.new
    @elevators = Array.new
    ELEVATOR_COUNT.times { add_elevator }
  end
  def add_elevator
    # This assumes all elevators have 40 floors
    elevator = Elevator.new(1,TOP_FLOOR)
    @elevators << elevator
  end

  def elevator_count
    # A getter method to return the value of the constant
    ELEVATOR_COUNT
  end
  
  def report_status
    @elevators.each do |e|
      print '|' + e.floor.to_s + ' ' + e.state.to_s + '|' + '  '
    end
    puts
  end
  
  def report_requests
    print "Requests:"
    @requests.keys.each do |r|
      print " " + r
    end
    puts
  end
  def push_button(direction,floor)
    if (!["u","d"].include?(direction)) then
      puts "Invalid direction!  Request not created.  Hope the elevator did not pass your destination."
    else
      @requests[direction + " " + floor.to_s] = 1
    end
    
  end
end
