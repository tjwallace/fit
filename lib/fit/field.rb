module Fit
  class Field

    attr_reader :value_raw
    attr_accessor :options

    def initialize(value_raw, options = nil)
      @value_raw = value_raw
      @options = default_options.merge(options || {})
    end

    def value
      @value ||= if @value_raw.is_a?(Numeric)
                   @value_raw.to_f / scale
                 else
                   @value_raw
                 end
    end

    def inspect
      out =  "#<#{self.class} name=#{name} value=#{value}"
      out << " units=#{units}" if units?
      out << " scale=#{scale}" if scale?
      out << ">"
    end

    def to_s
      "#{value}".tap do |v|
        v << " #{units}" if units?
      end
    end

    private

    def method_missing(name, *args)
      if name[-1] == "?"
        @options.has_key? name.to_s.delete!("?").to_sym
      elsif @options.has_key?(name)
        @options[name]
      else
        super
      end
    end

    def default_options
      {
        :name => 'unknown',
        :scale => 1
      }
    end

  end
end
