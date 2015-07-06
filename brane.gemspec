Gem::Specification.new do |gem|
  gem.name = 'brane'
  gem.version = '0.0.1'
  gem.authors = ['Ross Paffett']
  gem.email = ['ross@rosspaffett.com']
  gem.description = 'Simple Markov chain generator'
  gem.summary = gem.description
  gem.homepage = 'https://github.com/raws/brane'

  gem.files = `git ls-files`.split($\)
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'oklahoma_mixer', '>= 0.4.0'
end
