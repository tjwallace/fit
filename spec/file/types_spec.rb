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
      Fit::File::Types.class_variable_set(:@@types, Hash.new { |h,k| h[k]={} })
    end

    context 'for enum type' do
      it 'add enum data' do
        val = {:values => { 1 => 'val1', 2=> 'val2', 3 => 'val3'}}
        described_class.add_type(:test_enum, :enum, val)
        described_class.get_type_definition(:test_enum).should eql val
      end
    end
  end

  describe '.get_type_definition' do
    it 'returns nil when type does not exist' do
      described_class.get_type_definition(:rspec_unknown).should be_nil
    end
  end
  
  describe '.date_time_value' do
    context 'wen value below min' do
      it 'returns system time in second' do
        described_class.date_time_value(9999, {268435456 => 'min'}, {:utc => true}).should eql '9999'
        described_class.date_time_value(9999, {268435456 => 'min'}, {:utc => false}).should eql '9999'
      end
    end

    context 'when value is above min' do
      context 'with UTC mode' do
        it 'returns exact date UTC' do
          described_class.date_time_value(790509304, {268435456 => 'min'}, {:utc => true}).should eql '2015-01-18 09:55:04 UTC'
        end
      end
      
      context 'with local mode' do
        it 'returns exact date in locale time zone' do
          # TODO: manage answer based on current system local
          described_class.date_time_value(790509304, {268435456 => 'min'}, {:utc => false}).should_not match(/UTC$/)
        end
      end

    end
  end

  describe '.message_index_value' do
    let(:values) { {32768 => 'selected', 28672 => 'reserved', 4095 => 'mask' } }

    context 'when value is not reserved or selected' do
      it 'returns the message index' do
        described_class.message_index_value(10, values).should == 10
      end
    end

    context 'when value is reserved' do
      it 'returns real message index' do
        described_class.message_index_value(28682, values).should == 10
      end
    end

    context 'when value is selected' do
      it 'returns real message index' do
        described_class.message_index_value(32778, values).should == 10
      end
    end

  end

end

