# frozen_string_literal: true

module Fit
  class File
    class Record
      @@definitions = {}
      mattr_reader :definitions, instance_reader: false

      def self.read(io)
        new.read(io)
      end

      def self.clear_definitions!
        @@definitions.clear
      end

      attr_reader :header, :content

      def read(io)
        @header = RecordHeader.read(io)

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
end
