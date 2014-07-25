# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inrules/version'

Gem::Specification.new do |spec|
  spec.name          = "inrules"
  spec.version       = Inrules::VERSION
  spec.authors       = ["Roman Rodriguez"]
  spec.email         = ["roman.g.rodriguez@gmail.com"]
  spec.summary       = %q{Inrules gem}
  spec.description   = %q{A way to get data from json files}
  spec.homepage      = "https://github.com/romgrod/inrules"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
