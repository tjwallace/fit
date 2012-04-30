module Fit
  class Record

    @@definitions = {}

    class << self
      def read(io)
        self.new.read(io)
      end
    end

    attr_reader :header, :content

    def read(io)
      @header = Header.read(io)

      @content = case @header.message_type.snapshot
      when 1
        Definition.read(io).tap do |definition|
          @@definitions[@header.local_message_type.snapshot] = Data.generate(definition)
        end
      when 0
        definition = @@definitions[@header.local_message_type.snapshot]
        raise "No definition for local message type: #{@header.local_message_type}" if definition.nil?
        definition.read(io)
      end

      self
    end

  end
end
