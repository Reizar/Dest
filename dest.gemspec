# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dest/version'

Gem::Specification.new do |spec|
  spec.name          = "dest"
  spec.version       = Dest::VERSION
  spec.authors       = ["Aaron Rama"]
  spec.email         = ["me@aaronrama.com"]
  spec.summary       = "A ruby doctest library"
  spec.description   = "A ruby doctest library that allows you to write simple tests in your codes documentation."
  spec.homepage      = "https://github.com/Reizar/dest"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "colorize"
end
