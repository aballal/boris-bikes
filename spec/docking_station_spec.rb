require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  describe '#release_bike' do
    it "doesn't give out a bike if there's none" do
      expect { subject.release_bike }.to raise_error "bike not present"
    end

    it "doesn't raise the error when we have a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "doesn't release broken bikes" do
      broken_bike = Bike.new
      broken_bike.broken
      subject.dock(broken_bike)
      expect { subject.release_bike }.to raise_error "no working bikes available"
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes)}

  describe '#dock' do
    it 'docks a bike' do
      all_bikes = []
      bike = Bike.new
      all_bikes = subject.dock(bike)
      expect(subject.bikes).to eq all_bikes
    end

    it 'can store up to N bikes' do
      expect( subject.capacity.times { subject.dock(Bike.new)}).to eq subject.capacity
    end

    it 'returns error when more than N bikes' do
      expect { (subject.capacity+1).times {subject.dock(Bike.new)}}.to raise_error "Docking station full"
    end
  end

  describe '#new' do
    it 'responds to 1 argument' do
      expect(DockingStation).to respond_to(:new).with(1).argument
    end
    it 'sets a default value when no capacity is passed' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    it 'can take a default value when creating an instance' do
      station = DockingStation.new(25)
      expect(station.capacity).to eq 25
    end
  end

end
