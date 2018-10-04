require "boris_bikes"
require "pry"

describe Van do
  let(:bike_list) {[Bike.new(working=true), Bike.new(working=true), Bike.new(working=false), Bike.new(working=false)]}
  let(:working_bikes) {bike_list.select(&:working)}
  let(:broken_bikes) {bike_list.reject(&:working)}

  let(:station) {DockingStation.new}
  let(:garage) {Garage.new}
  let(:van) {Van.new}

  it 'collects broken bikes' do
    station.bikes = bike_list
    van.collect_broken(station)

    # should have all and only working bikes left at the station
    expect(station.bikes).to eq(working_bikes)
    # van should include all (but not necessarily only) the broken bikes
    expect(broken_bikes.all?{ |bike| van.bikes.include?(bike) }).to be_truthy
  end

   it 'collects working bikes' do
    garage.bikes = bike_list
    van.collect_working(garage)
    expect(garage.bikes).to eq(broken_bikes)
    expect(working_bikes.all?{ |bike| van.bikes.include?(bike) }).to be_truthy
   end

   it 'delivers broken bikes' do
     van.bikes = bike_list
     van.deliver_broken(garage)
     expect(van.bikes).to eq(working_bikes)
     expect(broken_bikes.all?{ |bike| garage.bikes.include?(bike) }).to be_truthy
   end

   it 'delivers working bikes' do
     van.bikes = bike_list
     van.deliver_working(station)
     expect(van.bikes).to eq(broken_bikes)
     expect(working_bikes.all?{ |bike| station.bikes.include?(bike) }).to be_truthy # THIS NEEDS WORK WITH DOCK AND MAX CAPACITY
   end

end
