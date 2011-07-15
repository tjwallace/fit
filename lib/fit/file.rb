module Fit
  class File

    class << self
      def read(io)
        self.new.read(io)
      end
    end

    attr_reader :header

    def read(io)
      @header = Header.read(io)
      @record = Record.read(io)
      self
    end

  end
end
