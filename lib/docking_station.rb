require_relative 'bike'

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

  def report_broken_bikes
    true
  end

  private

  def full?
    bikes.count == @capacity
  end

  def empty?
    bikes.empty?
  end

end
