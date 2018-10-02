require "boris_bikes"
describe DockingStation do
  it { should respond_to :release_bike }

  it "releases bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it "releases working bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

  it { should respond_to(:dock).with(1).argument }

  it "docks a bike" do
    bike = Bike.new
    station = subject
    station.dock(bike)
    expect(station.bike).to eq(bike)
  end

  it "raises an error when docking station is empty" do
    station = DockingStation.new
    station.bike = nil
    expect { station.release_bike }.to raise_error("station is empty!")
  end

end
