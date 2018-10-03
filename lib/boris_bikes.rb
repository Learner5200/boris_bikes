

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
  def initialize(working=true)
    @working = working
  end
  def report_broken
    @working = false
  end

  attr_accessor :working
end

class Van
  def initialize
    @van_bikes = []
  end
  def collect_broken(station)
    @van_bikes += station.bikes.reject{|bike| bike.working}
    station.bikes.select!{|bike| bike.working}
  end
  def collect_working(station)
    @van_bikes += station.bikes.select{|bike| bike.working}
    station.bikes.reject!{|bike| bike.working}
  end
  def deliver_broken(garage)
    garage.bikes += @van_bikes.reject{|bike| bike.working}
    @van_bikes.select!{|bike| bike.working}
  end
  def deliver_working(station)
    station.bikes += @van_bikes.select{|bike| bike.working}
    @van_bikes.reject!{|bike| bike.working}
  end
  attr_accessor :van_bikes
end

class Garage
  def initialize
    @bikes = []
  end
  attr_accessor :bikes
end
