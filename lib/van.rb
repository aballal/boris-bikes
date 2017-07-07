class Van

  def collect_broken_bikes(docking_station)
    @broken_bikes = docking_station.dispatch_broken_bikes
  end

  private
  attr_reader :broken_bikes

end
