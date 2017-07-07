require 'docking_station'
require 'bike'
require 'garage'

describe DockingStation do
  let(:bike) {double(:bike)}

  it { is_expected.to respond_to(:bikes) }

  it { is_expected.to respond_to(:capacity) }

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#release_bike' do

    it 'does not release a bike when docking station is empty' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it 'releases the bike when docking station has a bike' do
      bike = double(:bike, :working? => true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases working bikes' do
      bike = double(:bike, :working? => true)
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it 'does not release broken bikes' do
      allow(bike).to receive_message_chain(:report_broken, :working) {false}
      bike.report_broken
      subject.dock(bike)
      allow(bike).to receive(:working?).and_return(false)
      expect { subject.release_bike }.to raise_error "No working bikes available"
    end
  end

  describe '#dock' do

    it 'docks a bike' do
      all_bikes = []
      all_bikes = subject.dock(bike)
      expect(subject.bikes).to eq all_bikes
    end

    it 'can store up to N bikes' do
      expect( subject.capacity.times { subject.dock(bike)}).to eq subject.capacity
    end

    it 'returns error when more than N bikes' do
      expect { (subject.capacity+1).times {subject.dock(bike)}}.to raise_error "Docking station is full"
    end

    it 'accepts broken bikes' do
      allow(bike).to receive_message_chain(:report_broken,:working) {false}
      bike.report_broken
      expect(subject.dock(bike)).to eq [bike]
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

  describe '#dispatch_broken_bikes' do
    it 'can dispatch broken bikes' do
      #To be refactored to use doubles
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      van = Van.new
      expect(subject.dispatch_broken_bikes(van)).to eq [bike]
    end
  end

end
