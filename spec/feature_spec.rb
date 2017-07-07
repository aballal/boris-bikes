=begin
#Feature Test
#As a maintainer of the system,
#So that I can manage broken bikes and not disappoint users,
#I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

require_relative '../lib/bike'
require_relative '../lib/docking_station'
require_relative '../lib/van'
require_relative '../lib/garage'

docking_station = DockingStation.new
van = Van.new
garage = Garage.new

broken_bikes = []
5.times do |i|
  bike = Bike.new
  if (i == 2 || i == 4)   #Bikes 0,1,3 are working; Bikes 2 and 4 are broken
    bike.report_broken
    broken_bikes << bike
  end
  docking_station.dock(bike)
end
puts "Van successfully collected broken bikes from docking station" if broken_bikes == van.collect_broken_bikes(docking_station)
van.deliver_broken_bikes(garage)
puts "Van successfully delivered broken bikes to garage" if broken_bikes == garage.broken_bikes
=end
