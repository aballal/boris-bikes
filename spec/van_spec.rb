require 'van'

describe Van do

  it { is_expected.to respond_to(:capacity) }

  it { is_expected.to respond_to(:transport).with(3).arguments }

end
