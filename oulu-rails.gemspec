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

  gem.add_dependency("sass-rails", ">= 5.0.0.beta1")
  gem.add_dependency("compass-rails", '~> 2.0', '>= 2.0.0')
  gem.add_dependency("compass-rgbapng", '~> 0.2', '>= 0.2.0')
  gem.add_dependency("modular-scale", '~> 2.0', '>= 2.0.0')
  gem.add_dependency("oily_png", '~> 1.1', '>= 1.1.0')
  gem.add_dependency("ceaser-easing", '~> 0.7', '>= 0.7.0')
  gem.add_dependency("SassyLists", '~> 2.2', '>= 2.2.0')
  gem.add_dependency("toolkit", '~> 2.5', '>= 2.5.0')
  gem.add_dependency("sassy-maps", '~> 0.4', '>= 0.4.0')
end
