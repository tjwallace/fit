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
        array :fields, :type => Fit::Field, :initial_length => :field_count
      end
    end
  end
end
