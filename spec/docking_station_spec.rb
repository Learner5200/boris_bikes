require "boris_bikes"
describe DockingStation do
  it { should respond_to :release_bike }
  it "releases working bikes" do
    expect(subject.release_bike).to be_working
  end
  it { should respond_to(:dock).with(1).argument }
  it "docks a bike" do
    bike = Bike.new
    station = subject
    station.dock(bike)
    expect(station.bikes).to include(bike)
  end
end
