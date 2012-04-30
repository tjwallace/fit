require 'bindata'
require 'active_support/core_ext/class'

require 'logging'
require 'fit/logger'

require 'fit/file'
require 'fit/file/header'
require 'fit/message_data'
require 'fit/field'

require 'fit/record'
require 'fit/record/header'
require 'fit/record/definition'
require 'fit/record/data'

require 'fit/version'

module Fit

  extend Fit::Logger

  class << self
    def load_file(path)
      logger.debug "Loading fit file: #{path}"
      File.read ::File.open(path)
    end
  end

end
