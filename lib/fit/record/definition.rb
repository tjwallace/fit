module Fit
  class Record
    class Definition < BinData::Record

      class Field < BinData::Record
        hide :reserved_bits

        uint8 :field_definition_number
        uint8 :field_size
        bit1 :endian_ability
        bit2 :reserved_bits
        bit5 :base_type_number

        def data
          @data ||= MessageData.get_field(parent.parent.global_message_number.snapshot,
                                          field_definition_number.snapshot) ||
                      { :name => "field_#{field_definition_number.snapshot}", :scale => nil }
        end

        def name
          data[:name]
        end

        def raw_name
          "raw_#{name}"
        end

        def scale
          data[:scale]
        end

        def type
          case base_type_number.snapshot
          when 0 # enum
            build_int_type 8, false
          when 1
            build_int_type 8, true
          when 2
            build_int_type 8, false
          when 3
            build_int_type 16, true
          when 4
            build_int_type 16, false
          when 5
            build_int_type 32, true
          when 6
            build_int_type 32, false
          when 7
            "stringz"
          when 8
            "float"
          when 9
            "double"
          when 10 # uint8z
            build_int_type 8, false
          when 11 # uint16z
            build_int_type 16, false
          when 12 # uint32z
            build_int_type 32, false
          when 13 # array of bytes
            build_int_type 8, false
          else
            raise "Can't map base_type_number #{base_type_number} to a data type"
          end
        end

        private

        def build_int_type(length, signed)
          (signed ? '' : 'u') << 'int' << length.to_s
        end
      end

      skip :length => 1
      bit8 :architecture
      choice :global_message_number, :selection => :architecture do
        uint16le 0
        uint16be 1
      end
      bit8 :field_count
      array :fields, :type => Field, :initial_length => :field_count

      def endianness
        architecture.snapshot == 0 ? :little : :big
      end

    end
  end
end

