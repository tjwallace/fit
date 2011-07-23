module Fit
  class File
    class Header < BinData::Record
      endian :little

      uint8  :header_size, :value => 12, :check_value => 12
      uint8  :protocol_version
      uint16 :profile_version
      uint32 :data_size
      string :data_type, :read_length => 4

      def end_pos
        header_size + data_size - 2
      end
    end
  end
end
