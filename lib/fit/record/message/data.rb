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
          @values = {}
        end

        def read(io, definition)
          definition.fields.each do |field|
            @values[field.field_definition_number] = field.data_class.read(io).snapshot
          end if definition

          self
        end

      end
    end
  end
end
