require 'spec_helper'

describe Fit::File::Types do
  before :all do
    @types = described_class.class_variable_get :@@types
  end

  after :all do
    Fit::File::Types.class_variable_set(:@@types, @types)
  end

  describe '.add_type' do
    before :each do
      Fit::File::Types.class_variable_set(:@@types, Hash.new { |h, k| h[k] = {} })
    end

    context 'for enum type' do
      it 'add enum data' do
        val = { values: { 1 => 'val1', 2 => 'val2', 3 => 'val3' } }
        described_class.add_type(:test_enum, :enum, val)
        expect(described_class.get_type_definition(:test_enum)).to eql val.merge({ basic_type: :enum })
      end
    end
  end

  describe '.get_type_definition' do
    it 'returns nil when type does not exist' do
      expect(described_class.get_type_definition(:rspec_unknown)).to be_nil
    end
  end
  
  describe '.date_time_value' do
    context 'wen value below min' do
      it 'returns system time in second' do
        expect(described_class.date_time_value(9999, { 268435456 => 'min' }, { utc: true })).to eql '9999'
        expect(described_class.date_time_value(9999, { 268435456 => 'min' }, { utc: false })).to eql '9999'
      end
    end

    context 'when value is above min' do
      context 'with UTC mode' do
        it 'returns exact date UTC' do
          expect(described_class.date_time_value(790509304, { 268435456 => 'min' }, { utc: true })).to eql '2015-01-18 09:55:04 UTC'
        end
      end
      
      context 'with local mode' do
        it 'returns exact date in locale time zone' do
          # TODO: manage answer based on current system local
          expect(described_class.date_time_value(790509304, { 268435456 => 'min' }, { utc: false })).not_to match(/UTC$/)
        end
      end

    end
  end

  describe '.message_index_value' do
    let(:values) { { 32768 => 'selected', 28672 => 'reserved', 4095 => 'mask' } }

    context 'when value is not reserved or selected' do
      it 'returns the message index' do
        expect(described_class.message_index_value(10, values)).to eq(10)
      end
    end

    context 'when value is reserved' do
      it 'returns real message index' do
        expect(described_class.message_index_value(28682, values)).to eq(10)
      end
    end

    context 'when value is selected' do
      it 'returns real message index' do
        expect(described_class.message_index_value(32778, values)).to eq(10)
      end
    end

  end

  describe '.bitfield_value' do
    let(:values) { { 0x02 => 'read', 0x04 => 'write', 0x08 => 'erase' } }

    context 'when value is a single bit' do
      it 'returns the single value' do
        expect(described_class.bitfield_value(2, values)).to eq('read')
        expect(described_class.bitfield_value(4, values)).to eq('write')
        expect(described_class.bitfield_value(8, values)).to eq('erase')
      end
    end

    context 'when value is several bits' do
      it 'returns the values separated by a slash' do
        expect(described_class.bitfield_value(6, values)).to eq('read/write')
        expect(described_class.bitfield_value(12, values)).to eq('write/erase')
      end
    end
  end

end

