class Elevator
  attr_accessor :floor
  attr_accessor :state
  
  @@states = [:up,:down,:idle]
  
  def initialize
    @state = :idle
  end
end
