require_relative 'Elevator'

class Bank
  attr_accessor :elevators
  attr_accessor :requests
  
  ELEVATOR_COUNT = 3
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
      print '|' + e.floor.to_s + ' ' + e.state.to_s + ' ' + e.boarding_text + '|' + '  '
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
      puts "Invalid direction!  Request not created.  Skipping a turn also - Hope the elevator did not pass your floor prematurely!"
    else
      # By using a hash key of the combined direction and floor, we ensure that nobody "pushes a button" more than once
      @requests[direction + " " + floor.to_s] = :unhandled
    end
    
  end
  
  def resolve_requests
    @requests.keys.each do |r|
      (direction,floor) = r.split
      
      if (@requests[r] == :unhandled) then
	gotone = false
	# No elevator is currently handling this request.  Assign one.
	@elevators.each do |e|
	  #Debug
	  #puts "Checking elevator " + e.state.to_s + " " + e.floor.to_s + " " + @requests.to_s
          if (!gotone) then
            if (e.state == :idle) then
              # Assign an idle elevator unless one is on the way
              gotone = true
              e.changestate(floor.to_i)
              @requests[r] = e
            end
          end
	  
	  # If the request is still unhandled by the time it gets here,
	  # find an active elevator that's moving toward the requested floor and in a proper state 
	  
          if (!gotone && e.state.to_s[0] == direction) then
           if ((floor.to_i < e.floor && e.state == :down) || (floor.to_i > e.floor && e.state = :up))
	      puts "Found an elevator whose state is " + e.state.to_s + " and whose floor is " + e.floor.to_s
              gotone = true
              e.changestate(floor.to_i)
              @requests[r] = e
            end
	  end
            
        end
      end
    end
  end
  
  def move_elevators
    @elevators.each do |e|
      if (e.state == :up && !e.boarding?) then e.floor += 1 end
      if (e.state == :down && !e.boarding?) then e.floor -= 1 end
      
      # Are the slowpokes done boarding yet?  Sheez!
      if (e.boarding? && e.moving_on?) then
        puts "Elevator has finished boarding and is moving on"
	e.boarding = false
      end

      # Did it hit a floor that had a request?  If so, put it in a boarding state
      @requests.keys.each do |r|
	(direction,floor) = r.split

	if (@requests[r] == e && e.floor == floor.to_i) then
	  # It's a request that this elevator is handling
	  puts "Elevator arrived at floor " + e.floor.to_s + ", request fulfilled"
	  e.boarding = true
	  @requests.delete(r)
	  	  
	  # If the elevator has arrived at its "ultimate" destination, change the state back to idle
	  if (e.floor == e.destination_floor) then e.state = :idle end

	end
      end
    end
  end
end
