# encoding: utf-8

Gem::Specification.new do |gem|
  gem.add_dependency 'httparty', '~> 0.8.1'
  gem.add_development_dependency 'json'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'yard'
  gem.authors = ["Andy Brett"]
  gem.description = %q{A Ruby wrapper for the unofficial Jawbone UP API.}
  gem.email = ['andy@andybrett.com']
  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files = `git ls-files`.split("\n")
  gem.homepage = 'https://github.com/andrewpbrett/jawbone-up-api'
  gem.name = 'jawbone'
  gem.post_install_message =<<eos
********************************************************************************

  This is an **Unoffical** API - use at your own risk. See 
  http://eric-blue.com/projects/up-api/ for more info and full documentation. 

********************************************************************************
eos
  gem.require_paths = ['lib']
  gem.summary = %q{Jawbone UP API wrapper}
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version = 0.1
end