require 'spec_helper'

describe ConcernBox do

  it_should_behave_like('black_box',
    class:      Hash,
    attributes: %i(a b c d),
    methods:    %i([] size)
  )
end
