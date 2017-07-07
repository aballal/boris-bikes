require 'van'

class Garage

  attr_reader :broken_bikes_report

  def initialize
    @broken_bikes_report = Hash.new(0)
  end

  def receive_broken_bikes_report(docking_station,broken_bikes_count)
    @broken_bikes_report[docking_station] += broken_bikes_count
  end

  def pickup_broken_bikes
    puts ""
    @broken_bikes_report.each do |docking_station, broken_bikes_count|
      p docking_station
      p broken_bikes_count
    end
    puts ""
  end
end

#One garage that serves all docking stations
#GARAGE = Garage.new
