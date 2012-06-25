# -*- encoding: utf-8 -*-
require File.expand_path("../lib/brane", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ross Paffett"]
  gem.email         = ["ross@rosspaffett.com"]
  gem.description   = "Simple Markov chain generator using Tokyo Cabinet"
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/raws/brane"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "brane"
  gem.require_paths = ["lib"]
  gem.version       = Brane::VERSION
end
