# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'do_by/version'

Gem::Specification.new do |spec|
  spec.name          = "do_by"
  spec.version       = DoBy::VERSION
  spec.authors       = ["Andy Waite"]
  spec.email         = ["github.aw@andywaite.com"]
  spec.summary       = %q{Expiring TODOs}
  spec.description   = %q{Expiring TODOs}
  spec.homepage      = "https://github.com/andyw8/do_by"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
