require 'rspec'
require 'i3/blocks/clock'

describe I3::Blocks::Clock do
  subject { described_class.new() }
  it { is_expected.to be_a_kind_of I3::Blocks::Base }
  it { is_expected.to have_attributes(clock_format: '%Y-%m-%d %H:%M') }

  describe '.message' do
    subject { described_class.new().build_message }
    it { is_expected.to be_a I3::Bar::Message }
  end

  describe '.tick' do
    subject { described_class.new().call }
    it { is_expected.to be_a I3::Bar::Message }
  end

end
