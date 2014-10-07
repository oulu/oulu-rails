require 'oulu-rails/version'
require 'sass'
require 'compass'

module OuluRails
  class Engine < ::Rails::Engine
    initializer 'oulu_rails', after: 'compass.initialize_rails' do
      config.compass.require 'rgbapng'
      config.compass.require 'SassyLists'
      config.compass.require 'ceaser-easing'
      config.compass.require 'modular-scale'
      config.compass.require 'toolkit'
      config.require 'sassy-maps'
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
