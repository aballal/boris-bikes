require 'van'

describe Van do

  it { is_expected.to respond_to(:capacity) }

  it { is_expected.to respond_to(:collect_broken_bikes).with(2).arguments }

  describe '#collect_broken_bikes' do
    it 'can collect broken bikes from docking station' do

    end
  end

end
