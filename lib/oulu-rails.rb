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
  def get_unicode(string)
    assert_type string, :String
    Sass::Script::String.new(string.value.codepoints.map{ |i|
        '\\' + i.to_s(16).upcase
    }.join(''), :string)
  end
end

module Sass::Script::Functions
  include AddFunctions
end
