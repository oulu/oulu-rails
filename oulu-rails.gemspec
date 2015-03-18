# -*- encoding: utf-8 -*-
require File.expand_path('../lib/oulu-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["machida"]
  gem.email         = ["machida@fjord.jp"]
  gem.description   = %q{A mixin library for Sass.}
  gem.summary       = %q{A mixin library for Sass.}
  gem.homepage      = "http://oulu.github.io/"

  gem.files         = Dir["{lib,vendor}/**/*"] + ["MIT-LICENSE", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "oulu-rails"
  gem.require_paths = ["lib"]
  gem.version       = OuluRails::VERSION

  gem.add_runtime_dependency("sass-rails", "~> 5.0")
  gem.add_runtime_dependency("compass-rails", '~> 2.0', '>= 2.0.0')
  gem.add_runtime_dependency("bourbon")
end
