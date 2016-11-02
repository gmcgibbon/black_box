require 'spec_helper'

describe Analytics do

  before do
    described_class.configure do |config|
      config.write_key = 'mock'
    end
  end

  it_should_behave_like(
    'black_box',
    class:      Segment::Analytics,
    attributes: %i(write_key),
    methods:    %i(identify track)
  )

  describe '#identify' do

    let(:params) do
      { user_id: 0, attributes: { name: 'mock' } }
    end

    before do
      expect(
        described_class.instance.subject
      ).to receive(:identify).with(params)
    end

    it 'should forward to subject' do
      expect { described_class.identify params }.to_not raise_error
    end
  end

  describe '#track' do

    let(:params) do
      { user_id: 0, event: 'mock', properties: { type: 'mock' } }
    end

    before do
      expect(
        described_class.instance.subject
      ).to receive(:track).with(params)
    end

    it 'should forward to subject' do
      expect { described_class.track params }.to_not raise_error
    end
  end
end
