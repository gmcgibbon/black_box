$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'black_box'

%w(../support/**/*.rb).each do |path|
  Dir[File.expand_path(path, __FILE__)].each { |f| require f }
end
