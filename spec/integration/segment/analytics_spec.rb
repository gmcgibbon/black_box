require 'spec_helper'

describe Analytics do

  before do
    described_class.configure do |config|
      config.write_key = 'mock'
    end
  end

  it_should_behave_like('black_box',
    class:      Segment::Analytics,
    attributes: %i(write_key),
    methods:    %i(identify track)
  )
end
