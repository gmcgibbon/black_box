require 'pubnub'

class Realtime < BlackBox::Base

  subject Pubnub::Client

  accept *%i(subscribe_key publish_key secret_key logger ssl)

  expose *%i(publish subscribe)

end
