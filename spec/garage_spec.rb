require 'garage'
require 'bike'
require 'docking_station'
require 'van'

describe Garage do
  it 'can receive broken bikes from van' do
    #To be refactored to use doubles
    docking_station = DockingStation.new
    van = Van.new
    broken_bikes = []
    5.times do |i|
      bike = Bike.new
      if (i == 2 || i == 4)   #Bikes 0,1,3 are working; Bikes 2 and 4 are broken
        bike.report_broken
        broken_bikes << bike
      end
      docking_station.dock(bike)
    end
    expect(subject.receive_broken_bikes(broken_bikes)).to eq broken_bikes
  end
end
