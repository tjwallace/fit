module Fit
  class File

    class << self
      def read(io)
        self.new.read(io)
      end
    end

    attr_reader :header, :records

    def initialize
      @records = []
    end

    def read(io)
      @header = Header.read(io)
      18.times{ @records << Record.read(io) }
      self
    end

  end
end
