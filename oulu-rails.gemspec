# -*- encoding: utf-8 -*-
require File.expand_path('../lib/oulu-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["machida"]
  gem.email         = ["machida@fjord.jp"]
  gem.description   = %q{Sass tools for machida}
  gem.summary       = %q{Sass tools for machida}
  gem.homepage      = "http://fjord.jp"

  gem.files         = Dir["{lib,vendor}/**/*"] + ["MIT-LICENSE", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "oulu-rails"
  gem.require_paths = ["lib"]
  gem.version       = OuluRails::VERSION

  gem.add_dependency("sass-rails")
  gem.add_dependency("railties")
  gem.add_dependency("compass-rails")
  gem.add_dependency("ceaser-easing")
  gem.add_dependency("breakpoint")
  gem.add_dependency("respond-rails")
  gem.add_dependency("compass-rgbapng")
  gem.add_dependency("SassyLists")
  gem.add_dependency("toolkit")
  gem.add_dependency("sassy-maps")
  gem.add_dependency("rails-assets-font-awesome-animation")
  gem.add_dependency("rails-assets-Ladda")
end
