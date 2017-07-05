=begin
require './lib/docking_station'

station = DockingStation.new
p station.capacity

station = DockingStation.new(25)
p station.capacity
21.times {station.dock(Bike.new)}
puts station.bike.count
5.times {station.dock(Bike.new)}
=end
