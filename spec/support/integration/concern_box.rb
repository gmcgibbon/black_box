class ConcernBox

  include BlackBox::Concern

  subject Hash

  accept :a, :b, :c, :d

  expose :[], :size

end
