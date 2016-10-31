require 'segment'

class Analytics < BlackBox::Base

  subject Segment::Analytics

  accept *%i(write_key)

  expose *%i(identify track)

end
