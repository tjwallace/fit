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

#    context 'for basic type' do
#      it 'adds type data' do
#        described_class.add_type(:test_type, :sint8)
#        described_class.get_type(:test_type).should eql({:bindata_type => 'int8', :length => 1})
#        described_class.get_type(:test_type).should eql({})
#      end
#    end

    context 'for enum type' do
      it 'add enum data' do
        val = {:values => { 1 => 'val1', 2=> 'val2', 3 => 'val3'}}
        described_class.add_type(:test_enum, :enum, val)
#        described_class.get_type(:test_enum).should eql val.merge({:bindata_type => 'uint8', :length => 1})
        described_class.get_type(:test_enum).should eql val
      end
    end
  end

  describe '.get_type' do
    it 'returns nil when type does not exist' do
      described_class.get_type(:rspec_unknown).should be_nil
    end
  end
end

