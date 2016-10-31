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

  it_should_behave_like('black_box',
    class:      Pubnub::Client,
    attributes: %i(subscribe_key publish_key secret_key logger ssl),
    methods:    %i(publish subscribe)
  )
end
