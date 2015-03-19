require 'rspec'
require 'i3/blocks/volume'

describe I3::Blocks::Volume do
  let(:options) { {name: 'volume', sink: 0} }
  subject { described_class.new(options) }

  it { is_expected.to be_a_kind_of I3::Blocks::Base }
  it { is_expected.to have_attributes(options) }
end
