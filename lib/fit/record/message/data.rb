module Fit
  class Record
    module Message
      class Data < BinData::Record

        class_attribute :global_message_number, :instance_writer => false

        class << self
          def generate(definition)
            Class.new(self) do
              self.global_message_number = definition.global_message_number.snapshot
              endian definition.architecture == 0 ? :big : :little

              definition.fields.each do |field|
                add_field field
              end
            end
          end

          private

          def add_field(field)
            class_eval <<-EOV
              #{field.type} :#{field.raw_name}

              def #{field.name}
                #{field.raw_name}.snapshot #{ "/ #{field.scale.inspect}" if field.scale }
              end
            EOV
          end
        end

      end
    end
  end
end
