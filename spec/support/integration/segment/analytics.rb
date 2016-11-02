require 'segment'

class Analytics < BlackBox::Base

  subject Segment::Analytics

  accept :write_key

  expose :identify, :track

end
