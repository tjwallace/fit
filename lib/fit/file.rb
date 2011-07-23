module Fit
  class File

    class << self
      def read(io)
        self.new.read(io)
      end
    end

    attr_reader :header, :records, :crc

    def initialize
      @records = []
    end

    def read(io)
      @header = Header.read(io)
      while io.pos < @header.end_pos
        @records << Record.read(io)
      end
      @crc = io.read(2)
      self
    end

  end
end
