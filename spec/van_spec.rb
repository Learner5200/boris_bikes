require "boris_bikes"
require "pry"

describe Van do
 it 'collect broken bikes' do
  station = DockingStation.new
  station.bikes = [Bike.new, Bike.new, Bike.new(working=false), Bike.new(working=false)]
  subject.collect_broken(station)
  expect(station.bikes.all?{ |bike| bike.working }).to be_truthy
  expect(subject.van_bikes.all?{ |bike| !bike.working }).to be_truthy
 end

 it 'delivers broken bikes' do
   garage = Garage.new
   subject.van_bikes = [Bike.new, Bike.new, Bike.new(working=false), Bike.new(working=false)]
   subject.deliver_broken(garage)
   expect(subject.van_bikes.all?{|bike| bike.working}).to be_truthy
   expect(garage.bikes.all?{|bike| !bike.working}).to be_truthy
 end

 it 'collects working bikes' do
  station = DockingStation.new
  station.bikes = [Bike.new, Bike.new, Bike.new(working=false), Bike.new(working=false)]
  subject.collect_working(station)
  expect(station.bikes.all?{ |bike| !bike.working }).to be_truthy
  expect(subject.van_bikes.all?{ |bike| bike.working }).to be_truthy
 end

 it 'delivers working bikes' do
   station = DockingStation.new
   subject.van_bikes = [Bike.new, Bike.new, Bike.new(working=false), Bike.new(working=false)]
   subject.deliver_working(station)
   expect(subject.van_bikes.all?{|bike| !bike.working}).to be_truthy
   expect(station.bikes.all?{|bike| bike.working}).to be_truthy # THIS NEEDS WORK!!
 end

end
