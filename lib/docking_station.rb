require_relative 'bike'
require_relative 'garage'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if empty?
    bikes.each_with_index {|bike,i| return bikes.delete_at(i) if bike.working?}
    fail "No working bikes available"
  end

  def dock(bike)
    fail "Docking station is full" if full?
    bikes << bike
  end

  def dispatch_broken_bikes
    broken_bikes = []
    bikes.each.with_index {|bike,i| broken_bikes << bikes.delete_at(i) unless bike.working?}
    broken_bikes
  end

  private

  def full?
    bikes.count == @capacity
  end

  def empty?
    bikes.empty?
  end

end
