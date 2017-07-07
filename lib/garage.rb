class Garage

  attr_reader :broken_bikes_report

  def initialize
    @broken_bikes_report = Hash.new(0)
  end

  def receive_broken_bikes_report(docking_station,broken_bikes_count)
    @broken_bikes_report[docking_station] += broken_bikes_count
  end

end
