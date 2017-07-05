require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "bike not present" if empty?
    #bikes.shift
    i = 0
    until bikes[0].working? || i == bikes.count
      bikes.rotate
      i += 1
    end

    fail "no working bikes available" if i == bikes.count
    bikes.shift
  end

  def dock (bike)
    fail "Docking station full" if full?
    bikes << bike
  end

  private

  def full?
    bikes.count == @capacity
  end

  def empty?
    bikes.empty?
  end

end
