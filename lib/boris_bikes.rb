class DockingStation

  def initialize
    @bikes = []
  end

  private

  def empty?
    if @bikes.empty?
      true
    else
      false
    end
  end

  def full?
    if @bikes.length >= 20
      true
    else
      false
    end
  end

  public

  def dock(bike)
    fail("station is full!") if full?
    @bikes << bike
  end

  def release_bike
    fail("station is empty!") if empty?
    @bikes.pop
  end

  attr_accessor :bikes
end

class Bike
  def working?
    true
  end
end
