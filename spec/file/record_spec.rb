require 'spec_helper'

describe Fit::File::Record do
  before do
    described_class.clear_definitions!
    described_class.read(example_file('record/definition_record_2.fit'))
  end

  describe ".read" do
    subject { described_class.read(file) }

    context "given a sample definition record" do
      let(:file) { example_file('record/definition_record') }

      its(:header) { should be_a(Fit::File::RecordHeader) }
      its(:content) { should be_a(Fit::File::Definition) }

    end

    context "given a sample data record" do
      let(:file) { nil }
    end
  
    context "given a sample data record with a string non null terminated" do

      context 'string length is equal to field size' do
      
        let(:file) { example_file('record/data_record_2.fit') }

        its(:header) { should be_a(Fit::File::RecordHeader) }
        it { subject.content.raw_version.should == 250 }
        it { subject.content.raw_part_number.should == '123-A1234-00' }
      end

    context 'string length is smaller than field size' do
      
        let(:file) { example_file('record/data_record_2bis.fit') }

        its(:header) { should be_a(Fit::File::RecordHeader) }
        it { subject.content.raw_version.should == 251 }
        it { subject.content.raw_part_number.should == '123-A1234' }
      end
    end
  end

  describe ".read when field is doubled" do
    it "should read the entire record" do
      # read first the record definition
      described_class.read example_file('record/definition_record_3.fit')
      res = described_class.read example_file('record/data_record_3.fit')
      res.content.raw_field_2.should == 123456789
      res.content.raw_field_2__2.should == 987654321
      res.content.raw_field_4.should == 1
      res.content.raw_field_4__2.should == 3
      res.content.raw_field_8.should == 1539
    end
  end

  describe ".clear_definitions" do
    it "should clear the definitions class variable" do
      described_class.read example_file('record/definition_record')
      described_class.definitions.should_not be_empty
      described_class.clear_definitions!
      described_class.definitions.should be_empty
    end
  end
end
