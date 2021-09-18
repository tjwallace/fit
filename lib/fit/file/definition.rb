# frozen_string_literal: true

module Fit
  class File
    class Definition < BinData::Record

      class Field < BinData::Record
        hide :reserved_bits

        uint8 :field_definition_number
        uint8 :field_size
        bit1 :endian_ability
        bit2 :reserved_bits
        bit5 :base_type_number

        def data
          @data ||= Definitions.get_field(parent.parent.global_message_number.snapshot,
                                          field_definition_number.snapshot) ||
                      { name: "field_#{field_definition_number.snapshot}", scale: nil }
        end

        def dyn_data
          @dyn_data ||= Definitions.get_dynamic_fields(parent.parent.global_message_number.snapshot,
                                                       field_definition_number.snapshot)
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

        def real_type
          data[:type]
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
            # some cases found where string has the max field length
            # and is therefore not null terminated
            @length = 1
            "string"
          when 8
            @length = 4
            "float"
          when 9
            @length = 8
            "double"
          when 10 # uint8z
            build_int_type 8, false
          when 11 # uint16z
            build_int_type 16, false
          when 12 # uint32z
            build_int_type 32, false
          when 13 # array of bytes
            build_int_type 8, false
          when 14 # sint64
            build_int_type 64, true
          when 15 # uint64
            build_int_type 64, false
          when 16 # uint64z
            build_int_type 64, false
          else
            raise "Can't map base_type_number #{base_type_number} to a data type"
          end
        end

        # field_size is in byte
        def size
          field_size
        end
        
        # return the length in byte of the given type
        def length
          @length
        end

        private

        def build_int_type(length, signed)
          # @length is in byte not in bits, so divide by 8
          @length = length / 8

          sign = (signed ? '' : 'u')
          "#{sign}int#{length}"
        end
      end

      skip length: 1
      bit8 :architecture
      choice :global_message_number, selection: :architecture do
        uint16le 0
        uint16be 1
      end
      bit8 :field_count
      array :fit_fields, type: Field, initial_length: :field_count

      def endianness
        architecture.snapshot == 0 ? :little : :big
      end

      def record_type
        :definition
      end

    end
  end
end

