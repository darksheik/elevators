class Elevator
  attr_accessor :floor, :bottom_floor, :top_floor, :state
  
  @@states = [:up,:down,:idle,:boarding]
  
  def initialize(bf,tf)
    @state = :idle
    @bottom_floor = bf
    @top_floor = tf
    @floor = @bottom_floor
  end

end
