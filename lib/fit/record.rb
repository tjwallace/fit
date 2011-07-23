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
        @@definitions[@header.local_message_type.snapshot] = Message::Definition.read(io)
      when 0
        Message::Data.read(io, @@definitions[@header.local_message_type.snapshot])
      end

      self
    end

  end
end
