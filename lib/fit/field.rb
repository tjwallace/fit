module Fit
  class Field < BinData::Record
    hide :reserved_bits

    uint8 :field_definition_number
    uint8 :field_size
    bit1 :endian_ability
    bit2 :reserved_bits
    bit5 :base_type_number

    def data_class
      case base_type_number.snapshot
      when 0
        # FIXME enum
        build_int_class 8, false
      when 1
        build_int_class 8, true
      when 2
        build_int_class 8, false
      when 3
        build_int_class 16, true
      when 4
        build_int_class 16, false
      when 5
        build_int_class 32, true
      when 6
        build_int_class 32, false
      when 7
        BinData::Stringz
      when 8
        BinData.const_get('Float' << endian_suffix.capitalize)
      when 9
        BinData.const_get('Double' << endian_suffix.capitalize)
      when 10 # uint8z
        build_int_class 8, false
      when 11 # uint16z
        build_int_class 16, false
      when 12 # uint32z
        build_int_class 32, false
      when 13
        # FIXME array of bytes - anonymous class?
        build_int_class 8, false
      else
        raise "Can't map base_type_number #{base_type_number} to a data_class"
      end
    end

    private

    def build_int_class(length, signed)
      class_name = (signed ? '' : 'u') << 'int' << length.to_s << endian_suffix
      BinData.const_get class_name.capitalize
    end

    def endian_suffix
      parent.parent.architecture == 0 ? 'le' : 'be'
    end

  end
end
