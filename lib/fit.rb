require 'bindata'

module Fit

  autoload :File, 'fit/file'
  class File
    autoload :Header, 'fit/file/header'
  end

  autoload :Record, 'fit/record'
  class Record
    autoload :Header, 'fit/record/header'
    module Message
      autoload :Definition, 'fit/record/message/definition'
      autoload :Data, 'lib/record/message/data'
    end
  end

end

require 'fit/version'
