require 'logging'

module Fit
  module Logger

    class << self
      def logger
        @@logger ||= Logging.logger(STDOUT)
      end
    end

    def logger
      Fit::Logger.logger
    end

  end
end
