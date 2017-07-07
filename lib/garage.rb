class Garage

  attr_reader :broken_bikes

  def receive_broken_bikes(broken_bikes)
    @broken_bikes = broken_bikes
  end

end
