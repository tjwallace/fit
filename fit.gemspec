# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fit/version'

Gem::Specification.new do |spec|
  spec.name          = "fit-parser"
  spec.version       = Fit::VERSION
  spec.authors       = ["Jeff Wallace"]
  spec.email         = ["jeff@tjwallace.ca"]
  spec.description   = %q{Ruby gem for reading Garmin FIT files}
  spec.summary       = %q{Ruby gem for reading Garmin FIT files}
  spec.homepage      = "https://github.com/tjwallace/fit"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bindata", "~> 2.1.0"
  spec.add_dependency "activesupport", "~> 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.5.0"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "pry"
end
