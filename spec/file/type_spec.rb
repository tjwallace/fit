require 'spec_helper'

describe Fit::File::Type do
  before :all do
    @types = Fit::File::Types.class_variable_get :@@types
    Fit::File::Types.add_type(:int_type, :sint8)
    Fit::File::Types.add_type(:int_type_with_val, :uint8, :values => {1 => 'one', 2 => 'two', 3 => 'three'})
  end

  after :all do
    Fit::File::Types.class_variable_set(:@@types, @types)
  end

  describe '.get_type' do
    context 'when valid name' do
      it 'returns a type' do
        described_class.get_type(:int_type).should be_a Fit::File::Type
      end

      it 'returns always the same instance' do
        described_class.get_type(:int_type).should equal described_class.get_type(:int_type)
      end
    end
    
    context 'when invalid name' do
      it 'returns nil' do
        described_class.get_type(:unknown_type).should be_nil
      end
    end
  end

  describe '#value' do
    context 'when has values' do

      let(:type) { described_class.get_type(:int_type_with_val) }

      context 'valid requested value' do
        it 'returns the value' do
          type.value(2).should eql 'two'
        end
      end
      
      context 'invalid requested value' do
        it 'returns nil' do
          type.value(999).should be_nil
        end
      end
    end

    context 'when has no value' do
      it 'returns nil' do
        type = described_class.get_type(:int_type)
        type.value(1).should be_nil
      end
    end
  end
end
