require 'rspec'
require 'i3/blocks/base'

describe I3::Blocks::Base do
  subject { Class.new(described_class).new}

  it { is_expected.to have_attributes(name: '', interval: 5, options: {}) }
  it { expect(subject.respond_to?(:tick)).to be_truthy  }
end
