class BaseBox < BlackBox::Base

  subject Hash

  accept :a, :b, :c, :d

  expose :[], :size

end
