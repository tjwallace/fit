# frozen_string_literal: true

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

      it { expect(subject.header).to be_a Fit::File::RecordHeader }
      it { expect(subject.content).to be_a Fit::File::Definition }

    end

    context "given a sample data record" do
      let(:file) { nil }
    end

    context "given a sample data record with a string non null terminated" do

      context 'string length is equal to field size' do

        let(:file) { example_file('record/data_record_2.fit') }

        its(:header) { should be_a(Fit::File::RecordHeader) }
        it { expect(subject.content.raw_version).to be == 250 }
        it { expect(subject.content.raw_part_number).to be == '123-A1234-00' }
      end

    context 'string length is smaller than field size' do

        let(:file) { example_file('record/data_record_2bis.fit') }

        its(:header) { should be_a(Fit::File::RecordHeader) }
        it { expect(subject.content.raw_version).to be == 251 }
        it { expect(subject.content.version).to be == 2.51 }
        it { expect(subject.content.raw_part_number).to be == '123-A1234' }
        it { expect(subject.content.part_number).to be == '123-A1234' }
      end
    end
  end

  describe ".clear_definitions" do
    it "should clear the definitions class variable" do
      described_class.read example_file('record/definition_record')
      expect(described_class.definitions).to_not be_empty
      described_class.clear_definitions!
      expect(described_class.definitions).to be_empty
    end
  end
end
