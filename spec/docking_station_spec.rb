require "boris_bikes"

describe DockingStation do

  it { should respond_to :release_bike }

  it { should respond_to(:dock).with(1).argument }

  it "docks a bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to include bike
  end

  it "releases bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it "releases only working bikes" do
    bike = Bike.new
    bike.working = false
    subject.dock(bike)
    expect  {subject.release_bike}.to raise_error("bike is broken!")
  end


  context "it raises errors" do
    it "raises an error when docking station is empty" do
      expect { subject.release_bike }.to raise_error("station is empty!")
    end

    it "raises an error when docking station is full" do
      subject.capacity.times {subject.dock(Bike.new)}
      expect { subject.dock(Bike.new) }.to raise_error("station is full!")
    end

    it "has a variable capacity" do
      station = DockingStation.new(51)
      51.times {station.dock(Bike.new)}
      expect { station.dock(Bike.new) }.to raise_error("station is full!")
    end
  end

  it "can set new capacity" do
    station = DockingStation.new(2)
    expect(station.capacity).to eq(2)
  end

  it "has default capacity" do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

end
