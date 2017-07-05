require 'bike'

describe Bike do
  it {is_expected.to respond_to :working?}

  it "is woring when it is new" do
    expect(subject.working?).to eq true
  end

  it "can be set to not working" do
    subject.broken
    expect(subject.working?).to eq false
  end

end
