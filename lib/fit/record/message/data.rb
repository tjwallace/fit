module Fit
  class Record
    module Message
      class Data

        class << self
          def read(io, definition)
            self.new.read(io, definition)
          end
        end

        attr_reader :values

        def initialize
          @values = []
        end

        def read(io, definition)
          raise "nil definition given!" if definition.nil?

          definition.fields.each do |field|
            @values << Field.new(field.data_class.read(io).snapshot,
                                 MessageData.get_field(
                                   field.global_message_number.snapshot,
                                   field.field_definition_number.snapshot
                                 ))
          end

          self
        end

        def inspect
          @values.inspect
        end

      end
    end
  end
end
