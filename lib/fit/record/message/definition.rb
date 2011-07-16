module Fit
  class Record
    module Message
      class Definition < BinData::Record
        skip :length => 1
        bit8 :architecture
        choice :global_message_number, :selection => :architecture do
          uint16le 0
          uint16be 1
        end
        bit8 :field_count
        array :fields, :initial_length => :field_count do
          hide :reserved_bits

          int8 :field_definition_number
          int8 :field_size
          bit1 :endian_ability
          bit2 :reserved_bits
          bit5 :base_type_number
        end
      end
    end
  end
end
