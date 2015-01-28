require 'spec_helper'

describe Fit::File::Definition do
  context "given a sample definition message" do
    describe ".read" do
      subject do
        described_class.read example_file('record/message/definition')
      end

      its(:architecture) { should == 0 }
      its(:global_message_number) { should == 0 }
      its(:field_count) { should == 6 }
      it { should have(subject.field_count).fields }

      its(:record_type) { should == :definition }
      it 'returns the real type for fields' do
        subject.fields[0].real_type.should == :uint32z
        subject.fields[1].real_type.should == :date_time
        subject.fields[2].real_type.should == :manufacturer
        subject.fields[3].real_type.should == :uint16 # product
        subject.fields[4].real_type.should == :uint16 # number
        subject.fields[5].real_type.should == :file
      end
    end
  end
end
