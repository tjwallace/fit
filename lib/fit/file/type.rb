module Fit
  class File
    class Type

      @@types = {}

      def self.get_type(name)
        return @@types[name] if @@types.has_key? name
        type = Types.get_type name
        @@types[name] = type ? new(type) : nil
      end

      def initialize(type)
        @type = type
      end

#      def bindata_type
#        @type[:bindata_type]
#      end

      def value(val)
        res = @type[:values]
        res ? res[val] : nil
      end
    end
  end
end
