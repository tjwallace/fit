module Fit
  class Record
    class Data < BinData::Record

      class_attribute :global_message_number, :instance_writer => false

      def self.generate(definition)
        klass = Class.new(self) do
          self.global_message_number = definition.global_message_number.snapshot

          endian definition.endianness

          definition.fields.each do |field|
            class_eval <<-RUBY
              #{field.type} :#{field.raw_name}

              def #{field.name}
                #{field.raw_name}.snapshot #{ "/ #{field.scale.inspect}.0" if field.scale }
              end
            RUBY
          end
        end

        class_name = Fit::MessageData.get_name(definition.global_message_number.snapshot) ||
          "DataRecord#{definition.global_message_number.snapshot}"

        self.const_set(class_name.classify, klass)
      end

    end
  end
end
