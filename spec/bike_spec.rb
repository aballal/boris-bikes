require 'bike'

describe Bike do
  it {is_expected.to respond_to :working?}

  it {is_expected.to be_working}

  it "can be set to not working" do
    subject.report_broken
    expect(subject.working?).to eq false
  end

end
