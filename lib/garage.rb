class Garage

  def receive_broken_bikes(broken_bikes)
    @broken_bikes = broken_bikes
  end

  private
  attr_reader :broken_bikes

end
