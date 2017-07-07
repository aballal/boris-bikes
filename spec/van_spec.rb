require 'van'
require 'bike'
require 'docking_station'
require 'garage'

describe Van do

  it { is_expected.to respond_to(:collect_broken_bikes).with(1).arguments }

  describe '#collect_broken_bikes' do
    it 'can collect broken bikes from docking station' do
      #To be refactored to use doubles
      docking_station = DockingStation.new
      van = Van.new
      broken_bikes = []
      5.times do |i|
        bike = Bike.new
        if (i == 2 || i == 4)   #Bikes 0,1,3 are working; Bikes 2 and 4 are broken
          bike.report_broken
          broken_bikes << bike
        end
        docking_station.dock(bike)
      end
      expect(subject.collect_broken_bikes(docking_station)).to eq broken_bikes
    end
  end

end
