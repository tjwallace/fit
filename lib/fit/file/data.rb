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
            code = ""
            # in case the field size is a multiple of the field length, we must build an array
             if (field.type != "string" and field.size > field.length)
               code << "array :#{field.raw_name}, :type => :#{field.type}, :initial_length => #{field.size/field.length}\n"
             else
               # string are not null terminated when they have exactly the lenght of the field
               code << "#{field.type} :#{field.raw_name}"
               code << ", :read_length => #{field.size}, :trim_padding => true" if field.type == "string"
               code << "\n"
             end

             code << <<-RUBY
               def #{field.name}
                 #{field.raw_name}.snapshot #{ "/ #{field.scale.inspect}.0" if (field.scale && field.scale != 1)}
                end
             RUBY

             class_eval code , __FILE__, __LINE__ + 1
          end
        end
      end

    end
  end
end
