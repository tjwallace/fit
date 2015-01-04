module Fit
  class File
    class Data < BinData::Record

      class_attribute :global_message_number, :instance_writer => false

      def self.generate(definition)
        type = Definitions.get_name(definition.global_message_number.snapshot) ||
          "data_record_#{definition.global_message_number.snapshot}"

        Class.new(self) do
          self.global_message_number = definition.global_message_number.snapshot

          endian definition.endianness

          class_eval <<-RUBY, __FILE__, __LINE__ + 1
            def record_type
              :#{type}
            end
          RUBY

          definition.fields.each do |field|
            class_eval <<-RUBY, __FILE__, __LINE__ + 1
              # string are not null terminated when they have the field length
              #{field.type} :#{field.raw_name} #{ ", :read_length => #{field.size}, :trim_padding => true" if field.type == "string" }

              def #{field.name}
                #{field.raw_name}.snapshot #{ "/ #{field.scale.inspect}.0" if field.scale }
              end
            RUBY
          end
        end
      end

    end
  end
end
