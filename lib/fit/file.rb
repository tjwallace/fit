# frozen_string_literal: true

module Fit
  class File
    def self.read(io)
      new.read(io)
    end

    attr_reader :header, :records, :crc

    def initialize
      @records = []
    end

    def read(io)
      @header = Header.read(io)

      Record.clear_definitions!

      @records << Record.read(io) while io.pos < @header.end_pos

      @crc = io.read(2)

      self
    end
  end
end
