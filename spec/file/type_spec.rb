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
    context 'when type has values' do

      let(:type) { described_class.get_type(:int_type_with_val) }

      context 'known value requested' do
        it 'returns the value' do
          type.value(2).should eql 'two'
        end
      end
      
      context 'unknown value requested' do
        it 'returns the input value' do
          type.value(999).should eql 999
        end
      end

      context 'when invalid value is requested' do
        it 'returns nil' do
          type.value(255).should be_nil
          type.value(0xFF).should be_nil
        end
      end
    end

    context 'when type has date_time value' do
      let(:type) { described_class.get_type(:date_time) }
      it 'returns the date' do
        type.value(790509304).should == '2015-01-18 09:55:04 UTC'
      end
    end

    context 'when type has message_index value' do
      let(:type) { described_class.get_type(:message_index) }
      
      it 'returns the message_index' do
        type.value(10).should == 10
        type.value(32778).should == 10
        type.value(28682).should == 10
      end 

    end

    context 'when type has file_flags value' do
      let(:type) { described_class.get_type(:file_flags) }
      it 'returns the file_flags' do
        type.value(10).should == 'read/erase'
        type.value(0x0A).should == 'read/erase'
      end
    end

    context 'when type has bool value' do
      let(:type) { described_class.get_type(:bool) }
      it 'returns the boolean value' do
        type.value(0).should == 'false'
        type.value(1).should == 'true'
        type.value(255).should be_nil
      end
    end

    context 'when type has no value' do
      it 'returns nil' do
        type = described_class.get_type(:int_type)
        type.value(1).should eql 1
      end
    end
  end
end
