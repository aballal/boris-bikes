require 'garage'
require 'bike'
require 'docking_station'

describe Garage do
  let (:docking_station) {double(:docking_station)}

  it { is_expected.to respond_to(:broken_bikes_report) }

  it { is_expected.to respond_to(:receive_broken_bikes_report).with(2).arguments }

  it 'does not know about broken bikes unless reported' do
    expect(subject.broken_bikes_report[docking_station]).to eq 0
  end
=begin
  it 'can send vans to pickup bikes' do
    bike = Bike.new
    bike.report_broken
    docking_station = DockingStation.new
    docking_station.dock(bike)
    docking_station.report_broken_bikes
    expect(subject.pickup_broken_bikes).to eq [bike]
  end
=end
end
