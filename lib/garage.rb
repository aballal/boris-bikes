class Garage

  attr_reader :broken_bikes

  def initialize
    @broken_bikes = Hash.new(0)
  end

  def broken_bikes_reported(docking_station,broken_bikes_count)
    @broken_bikes[docking_station] += broken_bikes_count
  end

end

#One garage that serves all docking stations
GARAGE = Garage.new
