# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marskal/version'

Gem::Specification.new do |spec|
  spec.name          = "marskal"
  spec.version       = Marskal::VERSION
  spec.authors       = ["Mike Urban"]
  spec.email         = ["mike@marskalgroup.com"]

  spec.summary       = %q{This is the core and primary gem for all marskal-* gems}
  spec.description   = %q{This Gem contains the basic extensions to ruby methods/and utilities and base methods that act as support and provide inheritance for other layers of 'marskal-???' gems and applications}
  spec.homepage      = "https://github.com/MarskalGroup/marskal"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
