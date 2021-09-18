# frozen_string_literal: true

module Fit
  class File
    class Type
      @@types = {}

      def self.get_type(name)
        return @@types[name] if @@types.key? name

        type = Types.get_type_definition name
        @@types[name] = type ? new(type) : nil
      end

      def initialize(type)
        @type = type
      end

      def value(val)
        return nil unless is_valid(val)

        if @type.key? :method
          Types.send(@type[:method], val, @type[:values], @type[:parameters])
        else
          values = @type[:values]
          value = values[val] if values
          return value unless value.nil?

          val
        end
      end

      private

      def is_valid(val)
        invalid_value = if @type.key? :invalid
                          @type[:invalid]
                        else
                          Types.get_type_definition(@type[:basic_type])[:invalid]
                        end
        return false if val == invalid_value

        true
      end
    end
  end
end
