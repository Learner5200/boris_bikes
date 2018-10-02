class DockingStation
  def release_bike
    Bike.new
  end
  def dock(bike)
    @bikes ||= []
    @bikes << bike
  end
  attr_reader :bikes
end

class Bike
  def working?
    true
  end
end
