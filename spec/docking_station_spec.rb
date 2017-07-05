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
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike)}

  describe '#dock' do
    it 'docks a bike' do
      all_bikes = []
      bike = Bike.new
      all_bikes = subject.dock(bike)
      expect(subject.bike).to eq all_bikes
    end

    it 'can store up to N bikes' do
      expect( DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new)}).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'returns error when more than N bikes' do
      expect { (DockingStation::DEFAULT_CAPACITY+1).times {subject.dock(Bike.new)}}.to raise_error "Docking station full"
    end
  end

  describe '#new' do
    it 'Can take capacity when creating a new docking station' do
      expect(DockingStation).to respond_to(:new).with(1).argument
    end
  end
end
