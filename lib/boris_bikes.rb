class DockingStation

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail("station is full!") if @bikes.length >= 20
    @bikes << bike
  end

  def release_bike
    fail("station is empty!") if @bikes.empty?
    @bikes.pop
  end

  attr_accessor :bikes
end

class Bike
  def working?
    true
  end
end
