# frozen_string_literal: true

require 'bindata'
require 'active_support'
require 'active_support/core_ext/class'

require 'fit/file'
require 'fit/file/header'
require 'fit/file/record'
require 'fit/file/record_header'
require 'fit/file/types'
require 'fit/file/type'
require 'fit/file/definition'
require 'fit/file/data'
require 'fit/file/definitions'

require 'fit/version'

module Fit
  def self.load_file(path)
    File.read ::File.open(path)
  end
end
