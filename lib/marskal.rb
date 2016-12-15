require "marskal/version"
require "marskal/configuration"
require "marskal/utils"
require "marskal/core_ext"

##
# Marskal.
#
# This gem contains the basic extensions to ruby methods and custom utilities and other methods and functionality that
# act as support and provide inheritance for other layers of 'marskal-???' gems and applications
#
module Marskal
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

end
