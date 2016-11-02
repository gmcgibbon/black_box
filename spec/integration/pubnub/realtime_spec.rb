require 'spec_helper'

describe Realtime do

  before do
    described_class.configure do |config|
      config.subscribe_key = 'mock'
      config.publish_key   = 'mock'
      config.secret_key    = 'mock'
      config.logger        = Logger.new(StringIO.new)
      config.ssl           = true
    end
  end

  it_should_behave_like(
    'black_box',
    class:      Pubnub::Client,
    attributes: %i(subscribe_key publish_key secret_key logger ssl),
    methods:    %i(publish subscribe)
  )

  describe '#publish' do

    let(:params) do
      { channel: 'mock', message: 'hello world!' }
    end

    before do
      expect(
        described_class.instance.subject
      ).to receive(:publish).with(params)
    end

    it 'should forward to subject' do
      expect { described_class.publish params }.to_not raise_error
    end
  end

  describe '#subscribe' do

    let(:params) do
      { channel: 'mock' }
    end

    let(:block) do
      -> (message) {}
    end

    before do
      expect(
        described_class.instance.subject
      ).to receive(:subscribe).with(params, &block)
    end

    it 'should forward to subject' do
      expect { described_class.subscribe params, &block }.to_not raise_error
    end
  end
end
