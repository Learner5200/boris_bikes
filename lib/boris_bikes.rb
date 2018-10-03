

class DockingStation
  DEFAULT_CAPACITY = 20
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail("station is full!") if full?
    @bikes << bike
  end

  def release_bike
    fail("station is empty!") if empty?
    fail("bike is broken!") unless working?
    @bikes.pop
  end

  attr_accessor :bikes, :capacity

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.length >= @capacity
  end

  def working?
    @bikes.last.working
  end

end

class Bike
  def initialize
    @working = true
  end

  def working?
    @working
  end

  attr_accessor :working
end
