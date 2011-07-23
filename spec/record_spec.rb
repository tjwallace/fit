require 'spec_helper'

describe Fit::Record do
  context "given a sample definition record" do
    subject do
      described_class.read example_file('record/definition_record')
    end

    its(:header) { should be_a(Fit::Record::Header) }
    its(:content) { should be_a(Fit::Record::Message::Definition) }
  end
end
