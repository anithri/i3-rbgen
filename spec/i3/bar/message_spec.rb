require 'rspec'
require 'i3/bar/message'
require 'json'
describe I3::Bar::Message do
  let(:params) { {"full_text" => 'Testing', "short_text" => 'test', "color" => '#333333'} }
  let(:empty_params) do
    [:min_width, :align,
     :urgent, :name,
     :block_instance, :separator,
     :separator_block_width
    ].reduce({}) { |h, v| h[v] = nil; h }
  end
  subject { described_class.new(params) }
  it { is_expected.to have_attributes params }
  it { is_expected.to have_attributes empty_params }

  describe '.to_hash' do
    subject { described_class.new(params).to_hash }
    it { is_expected.to eq params }

    context 'with no params' do
      subject { described_class.new.to_hash}
      it { is_expected.to eq({}) }
    end
  end
end
