# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name = 'football_data_client'
  gem.authors = ['denis.terekhin']
  gem.email = ['kiddypoker@gmail.com']
  gem.version = '0.1.0'
  gem.summary = %q{ruby api wrapper of football-data.org}
  gem.description = %q{ruby api wrapper of football-data.org}
  gem.homepage = 'https://github.com/delta4d/football-data'
  gem.license = 'MIT'

  gem.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|gem|features)/}) }
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.12'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'pry', '~> 0.10'
  gem.add_dependency 'json', '~> 2.0.2'
  gem.add_dependency 'faraday', '~> 0.9'
end
