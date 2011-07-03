class Elevator
  attr_accessor :floor, :bottom_floor, :top_floor, :state, :destination_floor, :boarding
  
  @@states = [:up,:down,:idle]
  
  def initialize(bf,tf)
    @state = :idle
    @bottom_floor = bf
    @top_floor = tf
    @floor = @bottom_floor
    @boarding = false
  end

  def moving_on?
    # The amount of time it takes for people to get on an elevator will vary, so make it random.
    # Maybe somebody is holding the door
    chance = rand(2)  
    if (chance == 1) then self.boarding = false end
  end
  
  def changestate(f)
    if((@state == :up && @destination_floor < f) || (@state == :down && @destination_floor > f)) then 
      @destination_floor = f
    end
    if(@state == :idle) then
      @destination_floor = f
      @state = f > @floor ? :up : :down
    end
  end
  
  def boarding_text
    @boarding ? "brd" : ""
  end
end
