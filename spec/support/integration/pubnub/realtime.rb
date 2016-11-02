require 'pubnub'

class Realtime < BlackBox::Base

  subject Pubnub::Client

  accept :subscribe_key, :publish_key, :secret_key, :logger, :ssl

  expose :publish, :subscribe

end
