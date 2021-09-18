module Fit
  class File
    class Header < BinData::Record
      endian :little

      uint8  :header_size, check_value: -> { value >= 12 }
      uint8  :protocol_version
      uint16 :profile_version
      uint32 :data_size
      string :data_type, read_length: 4
      uint16 :crc, onlyif: -> { header_size == 14 }

      def end_pos
        header_size + data_size - 2
      end
    end
  end
end
