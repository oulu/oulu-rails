require 'oulu-rails/version'
require 'sass'

module OuluRails
  class Engine < ::Rails::Engine
  end
end

module Compass
  require "rgbapng"
  require 'SassyLists'
  require 'ceaser-easing'
  require 'modular-scale'
  require 'sassy-maps'
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
