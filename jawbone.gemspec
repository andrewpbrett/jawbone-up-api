# encoding: utf-8

Gem::Specification.new do |gem|
  gem.add_dependency 'httparty', '~> 0.11.0'
  gem.add_development_dependency 'json'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'yard'
  gem.authors = ["Andy Brett"]
  gem.description = %q{A Ruby wrapper for the Jawbone UP API.}
  gem.email = ['andy@andybrett.com']
  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files = %w(LICENSE.md README.md Rakefile)
  gem.files += Dir.glob("lib/**/*.rb")
  gem.files += Dir.glob("spec/**/*")
  gem.homepage = 'https://github.com/andrewpbrett/jawbone-up-api'
  gem.name = 'jawbone'
  gem.require_paths = ['lib']
  gem.summary = %q{Jawbone UP API wrapper}
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version = "0.3.0"
end