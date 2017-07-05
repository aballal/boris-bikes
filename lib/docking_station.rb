require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bike, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bike = []
    @capacity = capacity
  end

  def release_bike
    fail "bike not present" if empty?
    @bike.shift
  end

  def dock (bike)
    fail "Docking station full" if full?
    @bike << bike
  end

  private

  def full?
    @bike.count == DEFAULT_CAPACITY ? true : false
  end

  def empty?
    @bike.empty?
  end

end
