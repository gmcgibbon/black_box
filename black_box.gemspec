# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'black_box/version'

Gem::Specification.new do |spec|
  spec.name          = %q(black_box)
  spec.version       = BlackBox::VERSION
  spec.authors       = %w(Gannon McGibbon)
  spec.email         = %w(gannon.mcgibbon@gmail.com)

  spec.summary       = %q(Static wrappers for instantiated classes)
  spec.description   = <<-DESC.strip.chomp
  BlackBox turns any instantiated class into a singleton static class.
  DESC
  spec.homepage      = %q(https://github.com/gmcgibbon/black_box)
  spec.license       = %q(MIT)

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '~> 4.2'

  spec.add_development_dependency 'bundler',          '~> 1.12'
  spec.add_development_dependency 'rake',             '~> 10.0'
  spec.add_development_dependency 'rspec',            '~> 3.0'
  spec.add_development_dependency 'shoulda-matchers', '~> 3.1'
  spec.add_development_dependency 'rubocop',          '~> 0.44'
  spec.add_development_dependency 'analytics-ruby'
  spec.add_development_dependency 'pubnub'
end
