require 'rspec'
require 'i3/bar/sender'

describe I3::Bar::Sender do

  subject { described_class.new }
  it { is_expected.to be_a described_class }

  it { expect(subject.bus).to be_a DBus::SessionBus }

end
