module Fit
  class File
    class RecordHeader < BinData::Record
      hide :reserved_bits

      bit1 :header_type

      bit1 :message_type, :onlyif => :normal?
      bit2 :reserved_bits, :onlyif => :normal?

      choice :local_message_type, :selection => :header_type do
        bit4 0
        bit2 1
      end

      bit5 :time_offset, :onlyif => :compressed_timestamp?

      def normal?
        header_type == 0
      end

      def compressed_timestamp?
        header_type == 1
      end
    end
  end
end
