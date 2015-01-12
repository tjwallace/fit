require 'spec_helper'

describe Fit::File::Data do
  describe ".generate" do
    context 'standard definition' do
      let(:definition) do
        Fit::File::Definition.read example_file('record/message/definition')
      end

      subject { described_class.generate(definition) }

      its(:ancestors) { should include(BinData::Record) }
      its("new.record_type") { should eq(:file_id) }
    end

    context 'definition with multiple time the same field' do
      before :each do
        # force a fake definition for scaling of arrays
        Fit::File::Definitions.add_field 2, 2, "field_array", :type => 6, :scale => 10, :offset => 0
        definition = described_class.generate(Fit::File::Definition.read example_file('record/message/definition_3.fit'))
        @result = definition.read( example_file('record/message/data_3.fit') )
      end

      it "reads the entire record" do
        # read first the record definition
        @result.raw_field_array.should == [ 123456789, 987654321 ]
        @result.raw_field_4.should == [ 1, 3 ]
        @result.raw_field_8.should == 1539
        @result.raw_active_time_zone.should == 0
      end
    
      it "does not apply the scale equal to 1 for integer" do
        @result.raw_active_time_zone.should == 0
        @result.active_time_zone.to_s.should be_eql '0'
      end
      
      it "does not apply the scale equal to 1 for arrays" do
        @result.raw_field_4.should == [ 1, 3 ]
        @result.field_4.to_s.should be_eql '[1, 3]'
      end

      it "does apply scale on each element of an array" do
        @result.raw_field_array.should == [ 123456789, 987654321 ]
        @result.field_array.to_s.should be_eql '[12345678.9, 98765432.1]'
      end
    end
  end
end
