require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:bikes)}

  it { is_expected.to respond_to(:capacity)}

  it { is_expected.to respond_to :release_bike}

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#release_bike' do
    let(:bike) {double(:bike)}

    it 'does not release a bike when docking station is empty' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it 'releases the bike when docking station has a bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases working bikes' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it "doesn't release broken bikes" do
      broken_bike = Bike.new
      broken_bike.report_broken
      subject.dock(broken_bike)
      expect { subject.release_bike }.to raise_error "No working bikes available"
    end
  end

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
      expect { (subject.capacity+1).times {subject.dock(Bike.new)}}.to raise_error "Docking station is full"
    end

    it "accepts broken bikes" do
      broken_bike = Bike.new
      broken_bike.report_broken
      expect(subject.dock(broken_bike)).to eq [broken_bike]
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
