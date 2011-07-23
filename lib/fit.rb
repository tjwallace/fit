require 'bindata'
require 'active_support/core_ext/class'

require 'fit/file'
require 'fit/file/header'
require 'fit/message_data'
require 'fit/field'

require 'fit/record'
require 'fit/record/header'
require 'fit/record/message/definition'
require 'fit/record/message/data'

require 'fit/version'

module Fit

  class << self
    def load_file(path)
      File.read ::File.open(path)
    end
  end

end
