# -*- encoding: utf-8 -*-
require File.expand_path('../lib/identity_linker/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josh Starcher"]
  gem.email         = ["josh.starcher@gmail.com"]
  gem.description   = %q{Ruby library for accessing Cru's Identity Linking system}
  gem.summary       = %q{Ruby library for accessing Cru's Identity Linking system}
  gem.homepage      = "https://github.com/CruGlobal/identity_linker"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "identity_linker"
  gem.require_paths = ["lib"]
  gem.version       = IdentityLinker::VERSION
  gem.add_dependency('savon', '~> 0.9.14')
end
