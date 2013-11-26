# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monroe/version'

Gem::Specification.new do |spec|
  spec.name          = "monroe"
  spec.version       = Monroe::VERSION
  spec.authors       = ["Ben Winter"]
  spec.email         = ["ben.g.winter@gmail.com"]
  spec.description   = %q{Ruby interface for the Monroe political sentiment API}
  spec.summary       = %q{Provides access to Monroe's database of news articles, tweets, and political records with sentiment scores.}
  spec.homepage      = "https://github.com/blakeruddock/political-sentiment"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "json"
end


