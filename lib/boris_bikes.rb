class DockingStation
  def dock(bike)
    @bike = bike
  end

  def release_bike
    fail("station is empty!") unless @bike
    @bike
  end

  attr_accessor :bike
end

class Bike
  def working?
    true
  end
end
