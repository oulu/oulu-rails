require 'oulu-rails/version'
require 'sass'
require 'compass-rails'
require 'rgbapng'

module OuluRails
  class Engine < ::Rails::Engine
    initializer 'oulu_rails', after: 'compass.initialize_rails' do
      config.compass.require 'rgbapng'
    end
  end
end

module AddFunctions
  def remove_selector(string)
    assert_type string, :String
    return Sass::Script::String.new(string.value.gsub(/(\.|#)/, ""))
  end
end

module Sass::Script::Functions
  include AddFunctions
end
