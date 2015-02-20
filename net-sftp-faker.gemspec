# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'net/sftp/faker/version'

Gem::Specification.new do |spec|
  spec.name          = "net-sftp-faker"
  spec.version       = Net::Sftp::Faker::VERSION
  spec.authors       = ["Carlos Baraza Haro"]
  spec.email         = ["carlos.baraza@kneip.com"]
  spec.summary       = %q{net-sftp connections faker for testing purposes}
  spec.description   = %q{net-sftp connections faker for testing purposes}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
