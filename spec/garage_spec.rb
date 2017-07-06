require 'garage'

describe Garage do
  let (:docking_station) {double(:docking_station)}

  it { is_expected.to respond_to(:broken_bikes) }

  it { is_expected.to respond_to(:broken_bikes_reported).with(2).arguments }

  it 'does not know about broken bikes unless reported' do
    expect(subject.broken_bikes[docking_station]).to eq 0
  end
end
