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
        definition = described_class.generate(Fit::File::Definition.read example_file('record/message/definition_3.fit'))
        @result = definition.read( example_file('record/message/data_3.fit') )
      end

      it "reads the entire record" do
        # read first the record definition
        @result.raw_field_2.should == [ 123456789, 987654321 ]
        @result.raw_field_4.should == [ 1, 3 ]
        @result.raw_field_8.should == 1539
        @result.raw_active_time_zone.should == 0
      end
    
      it "record value should take into account the scale only when necessary" do
        @result.raw_field_4.should == [ 1, 3 ]
        @result.field_4.to_s.should be_eql '[1, 3]'
        @result.raw_active_time_zone.should == 0
        @result.active_time_zone.to_s.should be_eql '0'
      end
    end
  end
end
