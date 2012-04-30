require 'spec_helper'

describe Fit::Record do
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
