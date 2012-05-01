require 'spec_helper'

describe Fit::Record do
  before { described_class.clear_definitions! }

  describe ".read" do
    subject { described_class.read(file) }

    context "given a sample definition record" do
      let(:file) { example_file('record/definition_record') }

      its(:header) { should be_a(Fit::Record::Header) }
      its(:content) { should be_a(Fit::Record::Definition) }
    end

    context "given a sample data record" do
      let(:file) { nil }
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
