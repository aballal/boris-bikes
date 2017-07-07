class Van

  def collect_broken_bikes(docking_station)
    @broken_bikes = docking_station.dispatch_broken_bikes
  end

  def deliver_broken_bikes(garage)
    garage.receive_broken_bikes(broken_bikes)
  end

  private
  attr_reader :broken_bikes

end
