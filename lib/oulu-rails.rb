require 'oulu-rails/version'
require 'sass'

module OuluRails
  class Engine < ::Rails::Engine
    config.compass.require "rgbapng"
    config.compass.require 'SassyLists'
    config.compass.require 'ceaser-easing'
    config.compass.require 'modular-scale'
    config.require 'sassy-maps'
  end
end

module RemoveSelector
  def remove_selector(string)
    assert_type string, :String
    return Sass::Script::String.new(string.value.gsub(/(\.|#)/, ""))
  end
end

module Sass::Script::Functions
  include RemoveSelector
end
