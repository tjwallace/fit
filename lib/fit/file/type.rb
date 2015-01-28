module Fit
  class File
    class Type

      @@types = {}

      def self.get_type(name)
        return @@types[name] if @@types.has_key? name
        type = Types.get_type_definition name
        @@types[name] = type ? new(type) : nil
      end

      def initialize(type)
        @type = type
      end

      def value(val)
        return nil unless is_valid(val)
        if @type.has_key? :method
          Types.send(@type[:method], val, @type[:values], @type[:parameters])
        else
          values = @type[:values]
          value = values[val] if values
          value ||= val
        end
      end

      private
        def is_valid(val)
          if @type.has_key? :invalid
            invalid_value = @type[:invalid]
          else
            invalid_value = Types.get_type_definition(@type[:basic_type])[:invalid]
          end
          return false if val == invalid_value
          true
        end
    end
  end
end
