require 'rspec'
require 'i3/blocks/base'

describe I3::Blocks::Base do
  subject { Class.new(described_class).new}

  it { is_expected.to have_attributes(name: nil) }
  it { expect{subject.tick}.to raise_error NotImplementedError }

  describe '.message' do
    it { expect(subject.build_message).to be_a I3::Bar::Message  }
  end
end
