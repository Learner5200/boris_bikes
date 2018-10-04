require "boris_bikes"
require 'pry'

describe DockingStation do
  let(:bike) { double :bike }
  it { should respond_to :release_bike }

  it { should respond_to(:dock).with(1).argument }

  it "docks a bike" do
    subject.dock(bike)
    expect(subject.bikes).to include bike
  end

  it "releases bikes" do
    allow(bike).to receive(:working).and_return(true)
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it "releases only working bikes" do
    allow(bike).to receive(:working).and_return(false)
    subject.dock(bike)
    expect  {subject.release_bike}.to raise_error("bike is broken!")
  end


  context "it raises errors" do
    it "raises an error when docking station is empty" do
      expect { subject.release_bike }.to raise_error("station is empty!")
    end

    it "raises an error when docking station is full" do
      subject.capacity.times {subject.dock(bike)}
      expect { subject.dock(bike) }.to raise_error("station is full!")
    end

    it "has a variable capacity" do
      station = DockingStation.new(51)
      51.times {station.dock(bike)}
      binding.pry
      expect { station.dock(bike) }.to raise_error("station is full!")
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
